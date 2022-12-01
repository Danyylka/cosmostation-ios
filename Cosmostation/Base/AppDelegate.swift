//
//  AppDelegate.swift
//  Cosmostation
//
//  Created by yongjoo on 05/03/2019.
//  Copyright © 2019 wannabit. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase
import UserNotifications
import WalletConnectSwiftV2
import Starscream

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    var window: UIWindow?
    let gcmMessageIDKey = "gcm.message_id"
    var userInfo:[AnyHashable : Any]?
    var scheme: URL?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        initWalletConnectV2()
        BaseData.instance.copySalt = UUID().uuidString
        if UserDefaults.standard.object(forKey: "FirstInstall") == nil {
            KeychainWrapper.standard.removeAllKeys()
            UserDefaults.standard.set(false, forKey: "FirstInstall")
            UserDefaults.standard.synchronize()
        }
        
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { (granted, error) in
                    DispatchQueue.main.async {
                        if granted {
                            UIApplication.shared.registerForRemoteNotifications()
                        }
                        self.requestToken()
                    }
                })
            case .denied:
                break
            case .authorized, .provisional, .ephemeral:
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
                self.requestToken()
            }
        }
        
        return true
    }
    
    private func initWalletConnectV2() {
        let metadata = AppMetadata(
            name: NSLocalizedString("wc_peer_name", comment: ""),
            description: NSLocalizedString("wc_peer_desc", comment: ""),
            url: NSLocalizedString("wc_peer_url", comment: ""),
            icons: [])

        Networking.configure(projectId: Bundle.main.WALLET_CONNECT_API_KEY, socketFactory: self)
        Pair.configure(metadata: metadata)
        try? Pair.instance.cleanup()
        try? Sign.instance.cleanup()
    }
    
    func requestToken() {
        Messaging.messaging().token { token, error in
            if let error = error {
                print("Get FCM token error : \(error)")
            } else if let token = token {
                PushUtils.shared.updateTokenIfNeed(token: token)
            }
        }
    }
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if (url.scheme == "cosmostation") {
            if (application.topViewController is CommonWCViewController || application.topViewController is SBCardPopupViewController) {
                if let wcVC = application.topViewController as? CommonWCViewController {
                    wcVC.processQuery(host: url.host, query: url.query)
                }
            } else {
                scheme = url
                if let mainVC = UIApplication.shared.foregroundWindow?.rootViewController as? MainTabViewController {
                    mainVC.processScheme()
                } else {
                    let emptyWcVc = EmptyWCViewController(nibName: "EmptyWCViewController", bundle: nil)
                    application.topViewController!.present(emptyWcVc, animated: true, completion: nil)
                }
            }
        }
        return false
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        if let topViewController = application.topViewController {
            if !topViewController.isKind(of: PasswordViewController.self) && BaseData.instance.isRequiredUnlock() {
                let passwordVC = UIStoryboard.passwordViewController(delegate: nil, target: PASSWORD_ACTION_APP_LOCK)
                passwordVC.isModalInPresentation = true
                topViewController.present(passwordVC, animated: true, completion: nil)
            }
        }
        
        if (KeychainWrapper.standard.hasValue(forKey: BaseData.instance.copySalt!)) {
            KeychainWrapper.standard.removeObject(forKey: BaseData.instance.copySalt!)
        }
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        if let topViewController = application.topViewController, topViewController.isKind(of: PasswordViewController.self) {
            NotificationCenter.default.post(name: Notification.Name("ForeGround"), object: nil, userInfo: nil)
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        if (KeychainWrapper.standard.hasValue(forKey: BaseData.instance.copySalt!)) {
            KeychainWrapper.standard.removeObject(forKey: BaseData.instance.copySalt!)
        }
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        if application.applicationState == .inactive {
            UIApplication.shared.applicationIconBadgeNumber = 0
            guard let _ = userInfo["aps"] as? [String: Any],
                  let address = userInfo["address"] as? String else {
                    return
            }
            
            let notiAccount = BaseData.instance.selectAccountByAddress(address: address)
            if (notiAccount != nil) {
                BaseData.instance.setRecentAccountId(notiAccount!.account_id)
                BaseData.instance.setLastTab(2)
                DispatchQueue.main.async(execute: {
                    let mainTabVC = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateViewController(withIdentifier: "MainTabViewController") as! MainTabViewController
                    let rootVC = self.window?.rootViewController!
                    self.window?.rootViewController = mainTabVC
                    rootVC?.present(mainTabVC, animated: true, completion: nil)
                })
            }
        } else {
            UIApplication.shared.applicationIconBadgeNumber = 0
            guard let apsInfo = userInfo["aps"] as? [String: Any],
                  let alert = apsInfo["alert"] as? [String: Any],
                 let url = userInfo["url"] as? String,
                  let title = alert["title"] as? String,
                  let body = alert["body"] as? String else {
                    return
            }
            let alertController = UIAlertController(title: title, message: body, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: NSLocalizedString("mintscan_explorer", comment: ""), style: .default, handler: { (action) in
                UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
            }))
            alertController.addAction(UIAlertAction(title: NSLocalizedString("close", comment: ""), style: .cancel, handler: nil))
            window?.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.alert)
    }
}

extension UIApplication{
    var topViewController: UIViewController? {
        var pointedViewController = foregroundWindow?.rootViewController
        
        while pointedViewController?.presentedViewController != nil {
            switch pointedViewController?.presentedViewController {
            case let navagationController as UINavigationController:
                pointedViewController = navagationController.viewControllers.last
            case let tabBarController as UITabBarController:
                pointedViewController = tabBarController.selectedViewController
            default:
                pointedViewController = pointedViewController?.presentedViewController
            }
        }        
        if let navigationController = pointedViewController as? UINavigationController {
            pointedViewController = navigationController.viewControllers.last
        }
        return pointedViewController
    }
}

extension AppDelegate: WebSocketFactory {
    func create(with url: URL) -> WalletConnectSwiftV2.WebSocketConnecting {
        return WebSocket(request: URLRequest(url: url))
    }
}

extension WebSocket: WebSocketConnecting { }

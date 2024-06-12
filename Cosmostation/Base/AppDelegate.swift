//
//  AppDelegate.swift
//  Cosmostation
//
//  Created by yongjoo on 05/03/2019.
//  Copyright © 2019 wannabit. All rights reserved.
//

//YONG3
import UIKit
import SwiftKeychainWrapper
import Firebase
import UserNotifications
import WalletConnectRelay
import WalletConnectPairing
import WalletConnectSign
import Starscream

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, PinDelegate, MessagingDelegate {
    
    var window: UIWindow?
    let gcmMessageIDKey = "gcm.message_id"
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        let dataDict: [String: String] = ["token": fcmToken ?? ""]
        NotificationCenter.default.post(
            name: Notification.Name("FCMToken"),
            object: nil,
            userInfo: dataDict
        )
        print("didReceiveRegistrationToken ", fcmToken)
        if let token = fcmToken {
            PushUtils.shared.updateTokenIfNeed(token: token)
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        NSLog("Cosmostation application didFinishLaunchingWithOptions")
        setInit()
        setTheme()
        setFirebase()
        setWalletConnectV2()
        
        UNUserNotificationCenter.current().delegate = self
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
          options: authOptions,
          completionHandler: { _, _ in }
        )
        application.registerForRemoteNotifications()
        
        if let url = launchOptions?[UIApplication.LaunchOptionsKey.url] as? URL {
            BaseData.instance.appSchemeUrl = url
            NSLog("Cosmostation application didFinishLaunchingWithOptions \(url)")
            return false
        } else if let userInfo = launchOptions?[.remoteNotification] as? [AnyHashable: Any] {
            BaseData.instance.appUserInfo = userInfo
        }
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        NSLog("Cosmostation application open \(url.absoluteString)")
        if let topVC = application.topViewController, topVC.isKind(of: PincodeVC.self) {
            BaseData.instance.appSchemeUrl = url
            
        } else {
            NSLog("Cosmostation START DappDetailVC 1")
            let dappDetail = DappDetailVC(nibName: "DappDetailVC", bundle: nil)
            dappDetail.dappType = .DEEPLINK_WC2
            dappDetail.dappUrl = url
            dappDetail.modalPresentationStyle = .fullScreen
            application.topViewController?.present(dappDetail, animated: true)
        }
        return false
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        if let topVC = application.topViewController {
            if !topVC.isKind(of: PincodeVC.self) && BaseData.instance.getUsingAppLock() {
                let pinVC = UIStoryboard.PincodeVC(self, .ForAppLock)
                topVC.present(pinVC, animated: false, completion: nil)
            }
        }
    }
    
    func onPinResponse(_ request: LockType, _ result: UnLockResult) {
        if result == .success {
            if BaseData.instance.appSchemeUrl != nil {
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                    NSLog("Cosmostation START DappDetailVC 2")
                    let dappDetail = DappDetailVC(nibName: "DappDetailVC", bundle: nil)
                    dappDetail.dappType = .DEEPLINK_WC2
                    dappDetail.dappUrl = BaseData.instance.appSchemeUrl
                    dappDetail.modalPresentationStyle = .fullScreen
                    self.window?.rootViewController?.present(dappDetail, animated: true) {
                        BaseData.instance.appSchemeUrl = nil
                    }
                })
            }
        }
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        if let topVC = application.topViewController, topVC.isKind(of: PincodeVC.self) {
            NotificationCenter.default.post(name: Notification.Name("ForeGround"), object: nil, userInfo: nil)
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        if (KeychainWrapper.standard.hasValue(forKey: BaseData.instance.copySalt!)) {
            KeychainWrapper.standard.removeObject(forKey: BaseData.instance.copySalt!)
        }
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("getPush1 ", userInfo)
//        if application.applicationState == .inactive {
//            UIApplication.shared.applicationIconBadgeNumber = 0
//            guard let _ = userInfo["aps"] as? [String: Any],
//                  let address = userInfo["address"] as? String else {
//                    return
//            }
//
//            let notiAccount = BaseData.instance.selectAccountByAddress(address: address)
//            if (notiAccount != nil) {
//                BaseData.instance.setRecentAccountId(notiAccount!.account_id)
//                BaseData.instance.setLastTab(2)
//                DispatchQueue.main.async(execute: {
//                    let mainTabVC = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateViewController(withIdentifier: "MainTabViewController") as! MainTabViewController
//                    let rootVC = self.window?.rootViewController!
//                    self.window?.rootViewController = mainTabVC
//                    rootVC?.present(mainTabVC, animated: true, completion: nil)
//                })
//            }
//        } else {
//            UIApplication.shared.applicationIconBadgeNumber = 0
//            guard let apsInfo = userInfo["aps"] as? [String: Any],
//                  let alert = apsInfo["alert"] as? [String: Any],
//                 let url = userInfo["url"] as? String,
//                  let title = alert["title"] as? String,
//                  let body = alert["body"] as? String else {
//                    return
//            }
//            let alertController = UIAlertController(title: title, message: body, preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: NSLocalizedString("mintscan_explorer", comment: ""), style: .default, handler: { (action) in
//                UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
//            }))
//            alertController.addAction(UIAlertAction(title: NSLocalizedString("close", comment: ""), style: .cancel, handler: nil))
//            window?.rootViewController?.present(alertController, animated: true, completion: nil)
//        }
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.alert)
    }
}


extension AppDelegate: WalletConnectRelay.WebSocketFactory {
    func create(with url: URL) -> any WalletConnectRelay.WebSocketConnecting {
        return WebSocket(request: URLRequest(url: url))
    }
}

extension WebSocket: WalletConnectRelay.WebSocketConnecting {
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

    var foregroundWindow: UIWindow? {
        windows.filter {$0.isKeyWindow}.first
    }
}

private extension AppDelegate {
    func setInit() {
        BaseData.instance.appUserInfo = nil
        BaseData.instance.appSchemeUrl = nil
        BaseData.instance.copySalt = UUID().uuidString
        if UserDefaults.standard.object(forKey: "FirstInstall") == nil {
            KeychainWrapper.standard.removeAllKeys()
            try? BaseData.instance.getKeyChain().removeAll()
            UserDefaults.standard.set(false, forKey: "FirstInstall")
            UserDefaults.standard.synchronize()
        }
        
        if BaseData.instance.getInstallTime() == 0 {
            BaseData.instance.setInstallTime()
        }
    }
    
    func setTheme() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        navigationBarAppearance.backgroundColor = UIColor.clear
        navigationBarAppearance.shadowColor = UIColor.clear
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        
        let tabBarApperance = UITabBarAppearance()
        tabBarApperance.configureWithOpaqueBackground()
        tabBarApperance.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        UITabBar.appearance().scrollEdgeAppearance = tabBarApperance
        UITabBar.appearance().standardAppearance = tabBarApperance
        
        let attr = [NSAttributedString.Key.font: UIFont.fontSize12Bold]
        UISegmentedControl.appearance().setTitleTextAttributes(attr, for:.normal)
    }
    
    private func setFirebase() {
        if Bundle.main.bundleIdentifier == "io.wannabit.cosmostation" {
            FirebaseApp.configure()
            Messaging.messaging().delegate = self
        }
    }
    //YONG3
    private func setWalletConnectV2() {
        let metadata = AppMetadata(
            name: NSLocalizedString("wc_peer_name", comment: ""),
            description: NSLocalizedString("wc_peer_desc", comment: ""),
            url: NSLocalizedString("wc_peer_url", comment: ""),
            icons: []
        )

        Networking.configure(projectId: Bundle.main.WALLET_CONNECT_API_KEY, socketFactory: self)
        Pair.configure(metadata: metadata)
#if DEBUG
        try? Pair.instance.cleanup()
        try? Sign.instance.cleanup()
#endif
    }
}

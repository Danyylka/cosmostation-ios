//
//  DappStartVC.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/09/15.
//  Copyright © 2023 wannabit. All rights reserved.
//

import UIKit
import WebKit

class DappStartVC: BaseVC {
    
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        webView.isOpaque = false
        webView.backgroundColor = UIColor.clear
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.allowsBackForwardNavigationGestures = true
        webView.uiDelegate = self
        webView.allowsLinkPreview = false
        webView.scrollView.bounces = false
//        WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
//            records.forEach { record in
//                WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
//            }
//        }
//        if let dictionary = Bundle.main.infoDictionary,
//           let version = dictionary["CFBundleShortVersionString"] as? String {
//            webView.evaluateJavaScript("navigator.userAgent") { (result, error) in
//                let originUserAgent = result as! String
//                self.webView.customUserAgent = "Cosmostation/APP/iOS/DappTab/\(version) \(originUserAgent)"
//            }
//        }
        
        if let url = URL(string: "https://dapps.cosmostation.io") {
            webView.load(URLRequest(url: url))
        }
    }
    
    func presentDapp(_ url: URL) {
        print("presentDapp ", url)
        //TODO pincode ask?
        let dappDetail = DappDetailVC(nibName: "DappDetailVC", bundle: nil)
        dappDetail.url = url
        dappDetail.modalPresentationStyle = .fullScreen
        self.present(dappDetail, animated: true)
    }

}

extension DappStartVC: WKNavigationDelegate, WKUIDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let url = navigationAction.request.url {
            if (url.host == "dapps.cosmostation.io") {
                decisionHandler(.allow)
            } else {
                self.presentDapp(url)
                decisionHandler(.cancel)
            }
        } else {
            decisionHandler(.allow)
        }
        
    }
    
//    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
//        let alert = UIAlertController(title: NSLocalizedString("wc_alert_title", comment: ""), message: message, preferredStyle: .alert)
//        let cancelAction = UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: .cancel) { _ in
//            completionHandler()
//        }
//        alert.addAction(cancelAction)
//        DispatchQueue.main.async {
//            self.present(alert, animated: true, completion: nil)
//        }
//    }
//    
//    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
//        let alert = UIAlertController(title: NSLocalizedString("wc_alert_title", comment: ""), message: message, preferredStyle: .alert)
//        let cancelAction = UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: .cancel) { _ in
//            completionHandler(false)
//        }
//        let okAction = UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: .default) { _ in
//            completionHandler(true)
//        }
//        alert.addAction(cancelAction)
//        alert.addAction(okAction)
//        DispatchQueue.main.async {
//            self.present(alert, animated: true, completion: nil)
//        }
//    }
}

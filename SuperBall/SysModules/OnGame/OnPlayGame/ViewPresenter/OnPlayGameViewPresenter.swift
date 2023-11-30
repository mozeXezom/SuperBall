//
//  OnPlayGameViewPresenter.swift
//  SuperBall
//
//

import UIKit
import WebKit
import AppsFlyerLib
import OneSignalFramework

final class OnPlayGameViewPresenter: NSObject {
    private let onGameService = OnGameService()
    private let onGameDefaults = UserDefaults.standard
    let animationBallImages = [UIImage(named: "ballAnim1"), UIImage(named: "ballAnim2"), UIImage(named: "ballAnim3"), UIImage(named: "ballAnim4"), UIImage(named: "ballAnim5")]
    
    var onMenuButtonImage: UIImage {
        return UIImage(named: "superBallMenu")!
    }
    
    var gameUrl: String {
        return "https://preview.codecanyon.net/item/super-plinko-html5-game/full_screen_preview/33662260?_ga=2.129101579.688727867.1699956625-1830898887.1691924182"
    }
    
    var infoStartUrl: String {
        return "https://playvecc.com/Superball?subid="
    }
    
    var infoAdditionUrl: String {
        return "&push_id="
    }
    
    var loadingTxt: String {
        return "LOADING..."
    }
    
    var observerTxt: String {
        return """
            (function() {
                var originalLogFunction = console.log;
                console.log = function(message) {
                    if (message == "click") {
                        window.webkit.messageHandlers.click.postMessage(message);
                    }
                    originalLogFunction.apply(console, arguments);
                };
            })();
        """
    }
    
    func startOnGame(_ handler: @escaping (ContributionFinalStatus) -> Void) {
        let appsFlyerId = onGameDefaults.string(forKey: "UserAppsFlyerId")
        let onGameUrlString = "\(infoStartUrl)\(appsFlyerId ?? "")\(infoAdditionUrl)\(appsFlyerId ?? "")"
        guard let newUrl = URL(string: onGameUrlString) else {
            return handler(.error)
        }
        
        onGameService.prepareContributionRequest(forURL: newUrl) { [weak self] requested, urlToRequest, error in
            guard let self = self else { return }
            
            if error != nil {
                handler(.error)
            } else {
                if requested, let requestedUrl = urlToRequest {
                    handler(.url(requestedUrl))
                } else {
                    handler(.classic)
                }
            }
        }
    }
    
    func performDefaultWebView(_ view: UIView) {
        guard let defaultURL = URL(string: gameUrl) else {
            return
        }

        let userContentController = performUserController()
        let configuration = initiateCustomConfiguration(userContentController: userContentController)

        let webView = WKWebView(frame: view.bounds, configuration: configuration)
        view.addSubview(webView)
        webView.navigationDelegate = self
        webView.load(URLRequest(url: defaultURL))
    }
}

extension OnPlayGameViewPresenter: WKScriptMessageHandler, WKNavigationDelegate {
    func performCustomWebView(with view: UIView) {
        let userId = onGameDefaults.string(forKey: "UserAppsFlyerId")
        let webViewUrl = "\(infoStartUrl)\(userId ?? "")\(infoAdditionUrl)\(userId ?? "")"
        guard let infoURL = URL(string: webViewUrl) else {
            return
        }

        let userContentController = performUserController()
        let configuration = initiateCustomConfiguration(userContentController: userContentController)

        let webView = WKWebView(frame: view.bounds, configuration: configuration)
        view.addSubview(webView)
        OneSignal.login(userId ?? "")
        webView.navigationDelegate = self
        webView.load(URLRequest(url: infoURL))
    }

    private func performUserController() -> WKUserContentController {
        let userContentController = WKUserContentController()
        let script = observerTxt
        let userScript = WKUserScript(source: script, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
        userContentController.addUserScript(userScript)
        userContentController.add(self, name: "click")
        return userContentController
    }

    private func initiateCustomConfiguration(userContentController: WKUserContentController) -> WKWebViewConfiguration {
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userContentController
        return configuration
    }

    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        return WKWebView(frame: webView.frame, configuration: configuration)
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "click" {
            AppsFlyerLib.shared().logEvent("Register", withValues: ["Email" : "click"])
        }
    }
}

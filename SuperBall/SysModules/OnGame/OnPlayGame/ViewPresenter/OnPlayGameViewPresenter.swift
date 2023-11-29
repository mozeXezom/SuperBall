//
//  OnPlayGameViewPresenter.swift
//  SuperBall
//
//  Created by Yurii Derzhylo on 17.11.2023.
//

import UIKit
import WebKit

final class OnPlayGameViewPresenter: NSObject {
    private let onGameService = OnGameService()
    let animationBallImages = [UIImage(named: "ballAnim1"), UIImage(named: "ballAnim2"), UIImage(named: "ballAnim3"), UIImage(named: "ballAnim4"), UIImage(named: "ballAnim5")]
    
    var onMenuButtonImage: UIImage {
        return UIImage(named: "superBallMenu")!
    }
    
    var gameUrl: String {
        return "https://preview.codecanyon.net/item/super-plinko-html5-game/full_screen_preview/33662260?_ga=2.129101579.688727867.1699956625-1830898887.1691924182"
    }
    
    var infoUrl: String {
        return "https://playvecc.com/Superball"
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
        guard let newUrl = URL(string: gameUrl) else {
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
}

extension OnPlayGameViewPresenter: WKScriptMessageHandler, WKNavigationDelegate {
    func prepareWebView(with view: UIView) {
        guard let policyURL = URL(string: gameUrl) else {
            return
        }

        let userContentController = prepareWKUCController()
        let configuration = prepareWebViewConfiguration(userContentController: userContentController)

        let webView = WKWebView(frame: view.bounds, configuration: configuration)
        view.addSubview(webView)

        webView.navigationDelegate = self
        webView.load(URLRequest(url: policyURL))
    }

    private func prepareWKUCController() -> WKUserContentController {
        let userContentController = WKUserContentController()
        let script = observerTxt
        let userScript = WKUserScript(source: script, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
        userContentController.addUserScript(userScript)
        userContentController.add(self, name: "click")
        return userContentController
    }

    private func prepareWebViewConfiguration(userContentController: WKUserContentController) -> WKWebViewConfiguration {
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userContentController
        return configuration
    }

    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        return WKWebView(frame: webView.frame, configuration: configuration)
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "click" {
            //AppSpectator.shared.prepareUserEventLog(true)
        }
    }
}

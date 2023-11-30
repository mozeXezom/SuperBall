//
//  OnPolicyController.swift
//  SuperBall
//
//

import UIKit
import WebKit

class OnPolicyController: UIViewController {

    @IBOutlet weak var onWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initiatePrivacyPolicy()
    }
    
    private func initiatePrivacyPolicy() {
        if let pdfURL = Bundle.main.url(forResource: "SuperBallPrivacy", withExtension: "pdf") {
            let request = URLRequest(url: pdfURL)
            onWebView.load(request)
        }
    }
}

//
//  OnPlayGameViewController.swift
//  SuperBall
//
//  Created by Yurii Derzhylo on 17.11.2023.
//

import UIKit
import WebKit

class OnPlayGameViewController: UIViewController {
    
    @IBOutlet weak var gameView: UIView!
    
    private let viewPresenter: OnPlayGameViewPresenter = OnPlayGameViewPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPresenter.startOnGame { result in
            switch result {
            case .classic:
                self.viewPresenter.prepareWebView(with: self.gameView)
            case .error:
                print("error")
            case .url(let url):
                self.viewPresenter.prepareWebView(with: self.gameView)
            }
        }
    }
}

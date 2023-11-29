//
//  ViewController.swift
//  SuperBall
//
//  Created by Yurii Derzhylo on 16.11.2023.
//

import UIKit

class OnHelloViewController: UIViewController {
    
    @IBOutlet weak var onHelloBgImgView: UIImageView!
    @IBOutlet weak var onHelloLogoImgView: UIImageView!
    
    private let viewPresenter: OnHelloViewPresenter = OnHelloViewPresenter()
    private let coordinator: OnHelloCoordinator = OnHelloCoordinator()

    override func viewDidLoad() {
        super.viewDidLoad()
        initiateOnHelloViewController()
    }
    
    private func initiateOnHelloViewController() {
        onHelloBgImgView.image = viewPresenter.onHelloBackgroundImage
        onHelloLogoImgView.image = viewPresenter.onHelloLogoImage
        UserDefaults.standard.set(true, forKey: "hasSongBeenPlayed")
        UserDefaults.standard.synchronize()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            UIView.transition(with: self.view, duration: 2, options: .transitionCrossDissolve, animations: {
                self.coordinator.makeCoordinationWithOnTutorialController(selfController: self)
            }, completion: nil)
        }
    }
}


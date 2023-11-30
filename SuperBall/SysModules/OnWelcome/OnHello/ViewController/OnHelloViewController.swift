//
//  ViewController.swift
//  SuperBall
//
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


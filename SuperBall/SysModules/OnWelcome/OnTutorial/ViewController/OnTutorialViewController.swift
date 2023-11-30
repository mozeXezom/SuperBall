//
//  OnTutorialViewController.swift
//  SuperBall
//
//

import UIKit

class OnTutorialViewController: UIViewController {

    @IBOutlet weak var onTutorialBgImgView: UIImageView!
    @IBOutlet weak var onTutorialLogoImgView: UIImageView!
    @IBOutlet weak var onSettingsButton: UIButton!
    @IBOutlet weak var onShareButton: UIButton!
    @IBOutlet weak var onPlayButton: UIButton!
    
    @IBOutlet weak var oneTutButton: UIButton!
    @IBOutlet weak var twoTutButton: UIButton!
    @IBOutlet weak var threeTutButton: UIButton!
    
    private let viewPresenter: OnTurorialViewPresenter = OnTurorialViewPresenter()
    private let coordinator: OnTutorialCoordinator = OnTutorialCoordinator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initiateOnTutorialViewControllerUI()
        viewPresenter.getUserAppsFlyerId()
    }
    
    private func initiateOnTutorialViewControllerUI() {
        onTutorialBgImgView.image = viewPresenter.onTutorialBackgroundImage
        onTutorialLogoImgView.image = viewPresenter.onTutorialLogoImage
        onSettingsButton.setImage(viewPresenter.onSettingsImage, for: .normal)
        onShareButton.setImage(viewPresenter.onShareImage, for: .normal)
        onPlayButton.setImage(viewPresenter.onPlayImage, for: .normal)
        initiateButtons()
    }
    
    private func initiateButtons() {
        oneTutButton.setImage(viewPresenter.oneTutImage, for: .normal)
        twoTutButton.setImage(viewPresenter.twoTutImage, for: .normal)
        threeTutButton.setImage(viewPresenter.threeTutImage, for: .normal)
        oneTutButton.isHidden = true
        twoTutButton.isHidden = true
        threeTutButton.isHidden = true
    }
    
    @IBAction func onShareInsert(_ sender: UIButton) {
        viewPresenter.initiateInviteFriends(self)
    }
    
    @IBAction func onSettingsInsert(_ sender: UIButton) {
        coordinator.makeCoordinationWithOnSettingsController(selfController: self)
    }
    
    @IBAction func onPlayInsert(_ sender: UIButton) {
        UIView.transition(with: self.view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.oneTutButton.isHidden = false
            self.onTutorialLogoImgView.isHidden = true
            self.onPlayButton.isHidden = true
        }, completion: nil)
    }

    
    @IBAction func oneInsert(_ sender: UIButton) {
        UIView.transition(with: self.view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.oneTutButton.isHidden = true
            self.twoTutButton.isHidden = false
        }, completion: nil)
    }
    
    @IBAction func twoInsert(_ sender: UIButton) {
        UIView.transition(with: self.view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.twoTutButton.isHidden = true
            self.threeTutButton.isHidden = false
        }, completion: nil)
    }
    
    @IBAction func threeInsert(_ sender: UIButton) {
        coordinator.makeCoordinationWithOnPlayGameController(selfController: self)
    }
}

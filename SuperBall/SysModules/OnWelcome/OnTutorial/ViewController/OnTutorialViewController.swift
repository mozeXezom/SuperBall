//
//  OnTutorialViewController.swift
//  SuperBall
//
//  Created by Yurii Derzhylo on 16.11.2023.
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
        
    }
    
    @IBAction func onSettingsInsert(_ sender: UIButton) {
        coordinator.makeCoordinationWithOnSettingsController(selfController: self)
    }
    
    @IBAction func onPlayInsert(_ sender: UIButton) {
        oneTutButton.isHidden = false
        onTutorialLogoImgView.isHidden = true
        onPlayButton.isHidden = true
    }
    
    @IBAction func oneInsert(_ sender: UIButton) {
        oneTutButton.isHidden = true
        twoTutButton.isHidden = false
    }
    
    @IBAction func twoInsert(_ sender: UIButton) {
        twoTutButton.isHidden = true
        threeTutButton.isHidden = false
    }
    
    @IBAction func threeInsert(_ sender: UIButton) {
        coordinator.makeCoordinationWithOnPlayGameController(selfController: self)
    }
}

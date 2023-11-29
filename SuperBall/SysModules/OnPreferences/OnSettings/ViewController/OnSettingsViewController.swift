//
//  OnSettingsViewController.swift
//  SuperBall
//
//  Created by Yurii Derzhylo on 16.11.2023.
//

import UIKit

class OnSettingsViewController: UIViewController {

    @IBOutlet weak var settingsBgImageView: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var soundImageView: UIImageView!
    @IBOutlet weak var soundLabel: UILabel!
    @IBOutlet weak var privacyImageView: UIImageView!
    @IBOutlet weak var privacyLabel: UILabel!
    @IBOutlet weak var privacyButton: UIButton!
    @IBOutlet weak var soundSwitch: UISwitch!
    @IBOutlet weak var customLabel: UILabel!
    
    @IBOutlet weak var soundAskLabel: UILabel!
    @IBOutlet weak var soundAskSwitch: UISwitch!
    @IBOutlet weak var infoSetLabel: UILabel!
    
    private let viewPresenter: OnSettingsViewPresenter = OnSettingsViewPresenter()
    private let coordinator: OnSettingsCoordinator = OnSettingsCoordinator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initiateOnSettingsViewController()
        observeOnSettingsState()
    }
    
    private func initiateOnSettingsViewController() {
        initiateLocalization()
        initiateUI()
        viewPresenter.checkForAudioPlayState(soundSwitch)
    }
    
    private func initiateUI() {
        settingsBgImageView.image = viewPresenter.onSettingsBackgroundImage
        closeButton.setImage(viewPresenter.closeSettingsImage, for: .normal)
        soundImageView.image = viewPresenter.soundSettingsImage
        privacyImageView.image = viewPresenter.privacySettingsImage
        privacyButton.setImage(viewPresenter.settingsArrowImage, for: .normal)
    }
    
    private func initiateLocalization() {
        settingsLabel.text = viewPresenter.settingsTxt
        soundLabel.text = viewPresenter.soundTxt
        privacyLabel.text = viewPresenter.privacyTxt
        customLabel.text = viewPresenter.customTxt
        soundAskLabel.text = viewPresenter.soundAskTxt
        infoSetLabel.text = viewPresenter.infoSetTxt
    }
    
    private func observeOnSettingsState() {
        viewPresenter.checkAskForSoundState(soundAskSwitch)
    }
    
    @IBAction func closeButtonInsert(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func soundSwitchInsert(_ sender: UISwitch) {
        viewPresenter.defineAudioPlayState(sender)
    }
    
    @IBAction func privacyButtonInsert(_ sender: UIButton) {
        
    }
    
    @IBAction func soundAskSwitchInsert(_ sender: UISwitch) {
        if sender.isOn {
            viewPresenter.updateSoundState(true)
        } else {
            viewPresenter.updateSoundState(false)
        }
    }
}

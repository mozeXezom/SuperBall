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
    
    private let viewPresenter: OnSettingsViewPresenter = OnSettingsViewPresenter()
    private let coordinator: OnSettingsCoordinator = OnSettingsCoordinator()
    private let audioPlayer: AudioPlayer = AudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initiateOnSettingsViewController()
    }
    
    private func initiateOnSettingsViewController() {
        initiateLocalization()
        initiateUI()
        let isAudioPlaying = UserDefaults.standard.bool(forKey: "isAudioPlaying")
        soundSwitch.isOn = isAudioPlaying
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
    }
    
    private func updateAudioPlayerState(_ isPlaying: Bool) {
        soundSwitch.isOn = isPlaying
        if isPlaying {
            audioPlayer.pause()
        } else {
            audioPlayer.pause()
        }
        
        // Update UserDefaults
        UserDefaults.standard.set(isPlaying, forKey: "isAudioPlaying")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func closeButtonInsert(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func soundSwitchInsert(_ sender: UISwitch) {
        updateAudioPlayerState(sender.isOn)
    }
    
    @IBAction func privacyButtonInsert(_ sender: UIButton) {
        
    }
}

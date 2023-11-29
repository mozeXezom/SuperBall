//
//  OnPreferencesViewPresenter.swift
//  SuperBall
//
//  Created by Yurii Derzhylo on 16.11.2023.
//

import UIKit

final class OnSettingsViewPresenter: NSObject {
    private let onSettingsDefaults = UserDefaults.standard
    
    var onSettingsBackgroundImage: UIImage {
        return UIImage(named: "superBallBackground")!
    }
    
    var settingsArrowImage: UIImage {
        return UIImage(named: "arrowSettings")!
    }
    
    var closeSettingsImage: UIImage {
        return UIImage(named: "closeSettings")!
    }
    
    var soundSettingsImage: UIImage {
        return UIImage(named: "soundImage")!
    }
    
    var privacySettingsImage: UIImage {
        return UIImage(named: "privacyImage")!
    }
    
    var settingsTxt: String {
        return "Settings"
    }
    
    var soundTxt: String {
        return "Sound"
    }
    
    var privacyTxt: String {
        return "Privacy Policy"
    }
    
    var customTxt: String {
        return "Custom"
    }
    
    var soundAskTxt: String {
        return "Always asking before turning sound"
    }
    
    var infoSetTxt: String {
        return "Jelly Jumper"
    }
    
    func updateSoundState(_ state: Bool) {
        onSettingsDefaults.set(state, forKey: "switchOn")
    }
    
    func defineAudioPlayState(_ audioSwitcher: UISwitch) {
        if AudioPlayer.sharedPlayer.player?.isPlaying == true {
            AudioPlayer.sharedPlayer.pause()
        } else {
            AudioPlayer.sharedPlayer.play()
        }
    }
    
    func checkAskForSoundState(_ askSoundSwitcher: UISwitch) {
        if onSettingsDefaults.bool(forKey: "switchOn") {
            askSoundSwitcher.setOn(true, animated: false)
        } else {
            askSoundSwitcher.setOn(false, animated: false)
        }
    }
    
    func checkForAudioPlayState(_ audioSwitcher: UISwitch) {
        if AudioPlayer.sharedPlayer.player?.isPlaying == true {
            audioSwitcher.setOn(true, animated: false)
        } else {
            audioSwitcher.setOn(false, animated: false)
        }
    }
}

//
//  OnPreferencesViewPresenter.swift
//  SuperBall
//
//

import UIKit
import SafariServices

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
    
    var onRateImage: UIImage {
        return UIImage(named: "rateSuperball")!
    }
    
    var onMoreAppsImage: UIImage {
        return UIImage(named: "moreAppsBall")!
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
        return "SuperBall"
    }
    
    var rateUsTxt: String {
        return "Rate our app"
    }
    
    var otherTxt: String {
        return "Check our other apps"
    }
    
    var rateUsUrl: String {
        return "https://apps.apple.com/us/app/superball-gia/id6463219684?ppid=bfb42125-2822-41c9-a970-e01fe7c14172"
    }
    
    var moreAppsUrl: String {
        return "https://apps.apple.com/ua/app/superball-gia/id6463219684"
    }
    
    func updateSoundState(_ state: Bool) {
        onSettingsDefaults.set(state, forKey: "switchOn")
    }
    
    func openRateUsPage(_ urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
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

//
//  OnPreferencesViewPresenter.swift
//  SuperBall
//
//  Created by Yurii Derzhylo on 16.11.2023.
//

import UIKit

final class OnSettingsViewPresenter: NSObject {
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
}

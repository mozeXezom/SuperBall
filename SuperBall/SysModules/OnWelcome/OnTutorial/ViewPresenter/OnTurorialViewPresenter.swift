//
//  OnTurorialViewPresenter.swift
//  SuperBall
//
//

import UIKit
import AppsFlyerLib

final class OnTurorialViewPresenter: NSObject {
    private let onTutorialDefaults = UserDefaults.standard
    
    var onTutorialBackgroundImage: UIImage {
        return UIImage(named: "superBallBackground")!
    }
    
    var onTutorialLogoImage: UIImage {
        return UIImage(named: "superBallAppLogo")!
    }
    
    var onSettingsImage: UIImage {
        return UIImage(named: "ballSettings")!
    }
    
    var onShareImage: UIImage {
        return UIImage(named: "ballInvite")!
    }
    
    var onPlayImage: UIImage {
        return UIImage(named: "superPlay")!
    }
    
    var oneTutImage: UIImage {
        return UIImage(named: "oneTutorial")!
    }
    
    var twoTutImage: UIImage {
        return UIImage(named: "twoTutorial")!
    }
    
    var threeTutImage: UIImage {
        return UIImage(named: "threeTutorial")!
    }
    
    var inviteFriendsUrl: String {
        return "https://apps.apple.com/us/app/superball-gia/id6463219684?ppid=bfb42125-2822-41c9-a970-e01fe7c14172"
    }
    
    var inviteFriendsMessage: String {
        return "I invite you to play the game super ball with me"
    }
    
    func initiateInviteFriends(_ initController: UIViewController) {
        if let inviteFriendsUrl = URL(string: inviteFriendsUrl) {
            let inviteController = UIActivityViewController(activityItems: [inviteFriendsMessage, inviteFriendsUrl], applicationActivities: nil)
            initController.present(inviteController, animated: true, completion: nil)
        }
    }
    
    func getUserAppsFlyerId() {
        if AppsFlyerLib.shared().getAppsFlyerUID() != nil {
            let appsFlyerId = AppsFlyerLib.shared().getAppsFlyerUID()
            onTutorialDefaults.setValue(appsFlyerId, forKey: "UserAppsFlyerId")
            print("AppsFlyer ID: \(appsFlyerId)")
        } else {
            print("Unable to retrieve AppsFlyer ID")
        }
    }
}

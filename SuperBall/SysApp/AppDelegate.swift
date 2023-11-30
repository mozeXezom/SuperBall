//
//  AppDelegate.swift
//  SuperBall
//
//

import UIKit
import AppsFlyerLib
import OneSignalFramework

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initiateAudioPlayer()
        initiateAppsFlyer()
        initiateNotificationSignal(launchOptions)
        return true
    }
    
    func initiateAudioPlayer() {
        AudioPlayer.sharedPlayer.play()
    }
    
    func initiateAppsFlyer() {
        AppsFlyerLib.shared().appsFlyerDevKey = "2mrmboBoMtfwk4EeCSYhGa"
        AppsFlyerLib.shared().appleAppID = "6463219684"
        AppsFlyerLib.shared().isDebug = true
        AppsFlyerLib.shared().start()
    }
    
    func initiateNotificationSignal(_ launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        OneSignal.initialize("e592eb94-1538-4945-8301-68c252026113", withLaunchOptions: launchOptions)
        OneSignal.Notifications.requestPermission({ accepted in
            print("User accepted notifications: \(accepted)")
        }, fallbackToSettings: true)
    }
}


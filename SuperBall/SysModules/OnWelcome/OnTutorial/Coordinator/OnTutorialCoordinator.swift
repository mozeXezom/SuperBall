//
//  OnTutorialCoordinator.swift
//  SuperBall
//
//

import UIKit

final class OnTutorialCoordinator: NSObject {
    func makeCoordinationWithOnSettingsController(selfController: UIViewController) {
        if let onSettingsController = AppCoordinator.shared.initiateViewController(fromStoryboard: .onSettings, withIdentifier: .onSettingsController) as? OnSettingsViewController {
            onSettingsController.modalPresentationStyle = .overFullScreen
            selfController.present(onSettingsController, animated: true)
        }
    }
    
    func makeCoordinationWithOnPlayGameController(selfController: UIViewController) {
        if let onPlayGameController = AppCoordinator.shared.initiateViewController(fromStoryboard: .onGame, withIdentifier: .onPlayGameViewController) as? OnPlayGameViewController {
            AppCoordinator.shared.routeCoordinationTo(.fromRight, selfController: selfController, controllerToPresent: onPlayGameController)
        }
    }
}

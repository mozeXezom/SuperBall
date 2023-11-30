//
//  OnPreferencesCoordinator.swift
//  SuperBall
//
//

import UIKit

final class OnSettingsCoordinator: NSObject {
    func makeCoordinationWithOnPolicyController(selfController: UIViewController) {
        if let onPolicyController = AppCoordinator.shared.initiateViewController(fromStoryboard: .onSettings, withIdentifier: .onPolicyController) as? OnPolicyController {
            selfController.present(onPolicyController, animated: true)
        }
    }
}

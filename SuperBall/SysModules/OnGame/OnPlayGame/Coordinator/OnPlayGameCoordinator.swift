//
//  OnPlayGameCoordinator.swift
//  SuperBall
//
//  Created by Yurii Derzhylo on 29.11.2023.
//

import UIKit

final class OnPlayGameCoordinator: NSObject {
    func makeForwardCoordinationWithOnTutorialController(selfController: UIViewController) {
        if let onTurotialoController = AppCoordinator.shared.initiateViewController(fromStoryboard: .onWelcome, withIdentifier: .onTutorialController) as? OnTutorialViewController {
            AppCoordinator.shared.routeCoordinationTo(.fromLeft, selfController: selfController, controllerToPresent: onTurotialoController)
        }
    }
}

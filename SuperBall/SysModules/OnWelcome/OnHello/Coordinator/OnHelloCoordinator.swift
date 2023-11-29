//
//  OnHelloCoordinator.swift
//  SuperBall
//
//  Created by Yurii Derzhylo on 16.11.2023.
//

import UIKit

final class OnHelloCoordinator: NSObject {
    func makeCoordinationWithOnTutorialController(selfController: UIViewController) {
        if let onTurotialoController = AppCoordinator.shared.initiateViewController(fromStoryboard: .onWelcome, withIdentifier: .onTutorialController) as? OnTutorialViewController {
            AppCoordinator.shared.routeCoordinationTo(.fromRight, selfController: selfController, controllerToPresent: onTurotialoController)
        }
    }
}

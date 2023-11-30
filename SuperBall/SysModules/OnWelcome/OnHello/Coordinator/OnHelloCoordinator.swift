//
//  OnHelloCoordinator.swift
//  SuperBall
//
//

import UIKit

final class OnHelloCoordinator: NSObject {
    func makeCoordinationWithOnTutorialController(selfController: UIViewController) {
        if let onTurotialoController = AppCoordinator.shared.initiateViewController(fromStoryboard: .onWelcome, withIdentifier: .onTutorialController) as? OnTutorialViewController {
            AppCoordinator.shared.routeCoordinationTo(.fromRight, selfController: selfController, controllerToPresent: onTurotialoController)
        }
    }
}

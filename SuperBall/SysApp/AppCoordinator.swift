//
//  AppCoordinator.swift
//  SuperBall
//
//  Created by Yurii Derzhylo on 16.11.2023.
//

import UIKit

enum StoryboardInitName: String {
    case onWelcome = "OnWelcome"
}

enum ViewControllerInitIdentifier: String {
    case onHelloController = "onHelloController"
    case onTutorialController = "onTutorialController"
}

enum Direction {
    case fromLeft
    case fromRight
}

final class AppCoordinator {
    static let shared = AppCoordinator()

    private let onWelcomeStoryboard = UIStoryboard(name: StoryboardInitName.onWelcome.rawValue, bundle: nil)

    func initiateViewController(fromStoryboard storyboardName: StoryboardInitName, withIdentifier identifier: ViewControllerInitIdentifier) -> UIViewController? {
        let storyboard: UIStoryboard

        switch storyboardName {
        case .onWelcome:
            storyboard = onWelcomeStoryboard
        }

        return storyboard.instantiateViewController(withIdentifier: identifier.rawValue)
    }

    func routeCoordinationTo(_ direction: Direction, selfController: UIViewController, controllerToPresent: UIViewController, animated: Bool = true, duration: TimeInterval = 1) {
        controllerToPresent.modalPresentationStyle = .fullScreen

        if animated {
            let transition = CATransition()
            transition.duration = duration
            transition.type = .push
            transition.subtype = (direction == .fromLeft) ? .fromLeft : .fromRight

            // Apply the transition to the presenting view controller's view layer
            selfController.view.window?.layer.add(transition, forKey: kCATransition)
        }

        selfController.present(controllerToPresent, animated: false) {
            // Optionally perform actions after presentation
        }
    }

}


//
//  AppCoordinator.swift
//  SuperBall
//
//

import UIKit

enum StoryboardInitName: String {
    case onWelcome = "OnWelcome"
    case onSettings = "OnSettings"
    case onGame = "OnGame"
}

enum ViewControllerInitIdentifier: String {
    case onHelloController = "onHelloController"
    case onTutorialController = "onTutorialController"
    case onSettingsController = "onSettingsController"
    case onPlayGameViewController = "onPlayGameViewController"
    case onPolicyController = "onPolicyController"
}

enum Direction {
    case fromLeft
    case fromRight
}

final class AppCoordinator {
    static let shared = AppCoordinator()

    private let onWelcomeStoryboard = UIStoryboard(name: StoryboardInitName.onWelcome.rawValue, bundle: nil)
    private let onSettingsStoryboard = UIStoryboard(name: StoryboardInitName.onSettings.rawValue, bundle: nil)
    private let onGameStoryboard = UIStoryboard(name: StoryboardInitName.onGame.rawValue, bundle: nil)

    func initiateViewController(fromStoryboard storyboardName: StoryboardInitName, withIdentifier identifier: ViewControllerInitIdentifier) -> UIViewController? {
        let storyboard: UIStoryboard

        switch storyboardName {
        case .onWelcome:
            storyboard = onWelcomeStoryboard
        case .onSettings:
            storyboard = onSettingsStoryboard
        case .onGame:
            storyboard = onGameStoryboard
        }

        return storyboard.instantiateViewController(withIdentifier: identifier.rawValue)
    }

    func routeCoordinationTo(_ direction: Direction, selfController: UIViewController, controllerToPresent: UIViewController, animated: Bool = true, duration: TimeInterval = 1) {
        controllerToPresent.modalPresentationStyle = .fullScreen

        if animated {
            let transition = CATransition()
            transition.duration = duration
            transition.type = .fade
            transition.subtype = (direction == .fromLeft) ? .fromLeft : .fromRight

            selfController.view.window?.layer.add(transition, forKey: kCATransition)
        }

        selfController.present(controllerToPresent, animated: false) {
            //Some custom logic
        }
    }
}


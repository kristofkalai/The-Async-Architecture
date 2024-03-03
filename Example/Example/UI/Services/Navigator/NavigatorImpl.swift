//
//  NavigatorImpl.swift
//  Example
//
//  Created by Kristóf Kálai on 04/03/2024.
//

import UIKit

final class NavigatorImpl {
    private let navigationController: NavigationController

    init(rootViewController: UIViewController) {
        navigationController = .init(rootViewController: rootViewController)
    }
}

extension NavigatorImpl: Navigator {
    @MainActor func makeRoot(in window: UIWindow) {
        window.rootViewController = navigationController
    }

    @MainActor func navigateBack(toViewController viewController: UIViewController?, animated: Bool) {
        if let viewController {
            navigationController.popToViewController(viewController, animated: animated)
        } else {
            navigationController.popViewController(animated: animated)
        }
    }

    @MainActor func navigate(to screen: UIViewController, animated: Bool) {
        navigationController.pushViewController(screen, animated: animated)
    }

    @MainActor func navigateBackToRoot(animated: Bool) {
        navigationController.popToRootViewController(animated: animated)
    }
}

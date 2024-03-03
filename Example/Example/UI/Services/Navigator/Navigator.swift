//
//  Navigator.swift
//  Example
//
//  Created by Kristóf Kálai on 04/03/2024.
//

import UIKit
import TheAsyncArchitecture
import Resolver

public protocol Navigator: AnyObject {
    init(rootViewController: UIViewController)

    @MainActor func makeRoot(in window: UIWindow)
    @MainActor func navigateBack(toViewController viewController: UIViewController?, animated: Bool)
    @MainActor func navigate(to screen: UIViewController, animated: Bool)
    @MainActor func navigateBackToRoot(animated: Bool)
}

extension Navigator {
    @MainActor public func navigateBack(
        toViewController viewController: UIViewController? = nil,
        animated: Bool = true
    ) {
        navigateBack(toViewController: viewController, animated: animated)
    }

    @MainActor public func navigate<T: UIViewController>(to screen: T.Type, animated: Bool = true) {
        navigate(to: getScreen() as T, animated: animated)
    }

    @MainActor func navigate<S, C, ViewModel: BaseViewModel<S, C>, T: BaseScreen<S, C, ViewModel>>(
        to type: T.Type,
        with parameter: ViewModel.ParamType,
        animated: Bool = true
    ) where ViewModel: Parametrizable {
        let screen: T = getScreen()
        screen.set(parameter: parameter)
        navigate(to: screen, animated: animated)
    }

    @MainActor func navigateBackToRoot(animated: Bool = true) {
        navigateBackToRoot(animated: animated)
    }
}

extension Navigator {
    private func getScreen<T>() -> T {
        Resolver.resolve()
    }
}

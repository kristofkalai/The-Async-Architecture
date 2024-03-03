//
//  AppDelegate.swift
//  Example
//
//  Created by Kristóf Kálai on 04/03/2024.
//

import UIKit
import Resolver

@main
final class AppDelegate: UIResponder {
    var window: UIWindow?
}

extension AppDelegate: UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        setupDependencies()
        self.window = setupWindow()
        return true
    }
}

extension AppDelegate {
    private func setupDependencies() {
        Resolver.registerDomainServices()
        Resolver.registerDataServices()
        Resolver.registerUIServices()
    }

    private func setupWindow() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        window.makeKeyAndVisible()

        @LazyInjected var navigator: Navigator
        navigator.makeRoot(in: window)

        return window
    }
}

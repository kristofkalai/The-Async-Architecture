//
//  UI+DI.swift
//  Example
//
//  Created by Kristóf Kálai on 04/03/2024.
//

import Resolver

extension Resolver {
    public static func registerUIServices() {
        registerServices()

        registerMainScreen()
        registerDetailsScreen()
    }
}

extension Resolver {
    private static func registerServices() {
        register {
            NavigatorImpl(rootViewController: $0.resolve() as MainHostingScreen)
            // or to use UIKit:
            // NavigatorImpl(rootViewController: $0.resolve() as MainScreen)
        }
        .implements(Navigator.self)
        .scope(.application)
    }

    private static func registerMainScreen() {
        register(screen: MainScreen())
        register(screen: MainHostingScreen())
        register(viewModel: MainViewModel())
    }

    private static func registerDetailsScreen() {
        registerScreen(DetailsScreen(), viewModel: DetailsViewModel())
    }
}

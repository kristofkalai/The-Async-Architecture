//
//  Resolver+Extensions.swift
//
//
//  Created by Kristóf Kálai on 02/03/2024.
//

import Resolver

extension Resolver {
    public static func register<Screen>(screen: @escaping @autoclosure () -> Screen) {
        register(factory: screen)
    }

    public static func register<ViewModel>(viewModel: @escaping @autoclosure () -> ViewModel) {
        register(factory: viewModel)
            .scope(.shared)
    }

    public static func registerScreen<Screen, ViewModel>(
        _ screen: @escaping @autoclosure () -> Screen,
        viewModel: @escaping @autoclosure () -> ViewModel
    ) {
        register(screen: screen())
        register(viewModel: viewModel())
    }
}

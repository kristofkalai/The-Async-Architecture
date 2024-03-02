//
//  BaseHostingScreen.swift
//
//
//  Created by Kristóf Kálai on 02/03/2024.
//

import SwiftUI
import UIKit
import Resolver

open class BaseHostingScreen<Content: ScreenView, State, Command, ViewModel: BaseViewModel<State, Command>>: ViewController {
    @LazyInjected private var viewModel: ViewModel

    public override init() {
        super.init()
        setupContentView()
    }
}

extension BaseHostingScreen {
    private func setupContentView() {
        let hostingController = UIHostingController(rootView: Content())

        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)

        hostingController.view.backgroundColor = .clear

        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

//
//  MainViewModel.swift
//  Example
//
//  Created by Kristóf Kálai on 04/03/2024.
//

import Combine
import Foundation
import TheAsyncArchitecture
import Resolver

final class MainViewModel: BaseViewModel<MainState, MainCommand> {
    @LazyInjected private var authenticationStore: AuthenticationStore
    @LazyInjected private var authenticationAction: AuthenticationAction
    @LazyInjected private var navigator: Navigator

    private var cancellables = Set<AnyCancellable>()

    override init() {
        super.init()
        setup()
    }

    override func receive(command: MainCommand) async {
        switch command {
        case let .selected(mainItem):
            await navigator.navigate(to: DetailsScreen.self, with: .title(mainItem.title))
        }
    }
}

extension MainViewModel {
    private func setup() {
        authenticationStore.state
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] _ in
                sendState(.init(items: [.init(title: "Title 1"), .init(title: "Title 2")]))
            }
            .store(in: &cancellables)

        Task {
            try await authenticationAction.authenticate()
        }
    }
}

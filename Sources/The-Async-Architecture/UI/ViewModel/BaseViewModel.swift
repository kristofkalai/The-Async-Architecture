//
//  BaseViewModel.swift
//
//
//  Created by Kristóf Kálai on 02/03/2024.
//

import Combine
import Resolver
import SwiftUI

open class BaseViewModel<State: Equatable & Defaultable, Command>: ObservableObject {
    @Published public var state = State.default

    var viewState: AnyPublisher<State, Never> {
        $state.eraseToAnyPublisher()
    }

    open func receive(command: Command) async {}

    public init() {}
}

extension BaseViewModel {
    public final func sendState(_ state: State) {
        self.state = state
    }

    public final func createNewState(creation: (State) -> State) {
        sendState(creation(state))
    }
}

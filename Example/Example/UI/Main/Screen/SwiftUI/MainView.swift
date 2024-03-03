//
//  MainView.swift
//  Example
//
//  Created by Kristóf Kálai on 04/03/2024.
//

import SwiftUI
import Resolver
import TheAsyncArchitecture

struct MainView: ScreenView {
    typealias ViewState = MainState
    typealias ViewCommand = MainCommand

    @InjectedObject var viewModel: MainViewModel
}

extension MainView {
    func content(state: MainState, command: @escaping (MainCommand) async -> Void) -> some View {
        ForEach(state.items) { item in
            Text(item.title)
                .onTapGesture {
                    Task {
                        await command(.selected(item))
                    }
                }
        }
    }
}

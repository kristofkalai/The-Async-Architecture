//
//  ScreenView.swift
//
//
//  Created by Kristóf Kálai on 02/03/2024.
//

import SwiftUI
import Combine

public protocol ScreenView: View {
    associatedtype Content: View
    associatedtype ViewState: Equatable & Defaultable
    associatedtype ViewCommand
    associatedtype ViewModel: BaseViewModel<ViewState, ViewCommand>

    var viewModel: ViewModel { get }
    init()
    @ViewBuilder func content(state: ViewState, command: @escaping (ViewCommand) async -> Void) -> Content
}

extension ScreenView {
    public var body: some View {
        content(state: viewModel.state, command: viewModel.receive)
            .ignoresSafeArea(.all)
    }
}

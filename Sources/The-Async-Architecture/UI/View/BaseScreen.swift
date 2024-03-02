//
//  BaseScreen.swift
//
//
//  Created by Kristóf Kálai on 02/03/2024.
//

import UIKit
import Resolver
import Combine

open class BaseScreen<State, Command, ViewModel: BaseViewModel<State, Command>>: ViewController {
    @LazyInjected private var viewModel: ViewModel
    var cancellables = Set<AnyCancellable>()

    open func receiveState(_ state: State) {}

    public final func send(command: Command) async {
        await viewModel.receive(command: command)
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }

    open func set(parameter: ViewModel.ParamType) where ViewModel: Parametrizable {
        viewModel.set(parameter: parameter)
    }
}

extension BaseScreen {
    private func setupBindings() {
        viewModel.viewState
            .removeDuplicates()
            .sink { [unowned self] in receiveState($0) }
            .store(in: &cancellables)
    }
}

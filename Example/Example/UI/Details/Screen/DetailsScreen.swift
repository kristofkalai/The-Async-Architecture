//
//  DetailsScreen.swift
//  Example
//
//  Created by Kristóf Kálai on 04/03/2024.
//

import TheAsyncArchitecture

final class DetailsScreen: BaseScreen<DetailsState, DetailsCommand, DetailsViewModel> {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }

    override func receiveState(_ state: DetailsState) {
        super.receiveState(state)
        title = state.title
    }
}

//
//  DetailsViewModel.swift
//  Example
//
//  Created by Kristóf Kálai on 04/03/2024.
//

import TheAsyncArchitecture

final class DetailsViewModel: BaseViewModel<DetailsState, DetailsCommand>, Parametrizable {
    func set(parameter: DetailsScreenParameter) {
        switch parameter {
        case let .title(string): sendState(.init(title: string))
        }
    }
}

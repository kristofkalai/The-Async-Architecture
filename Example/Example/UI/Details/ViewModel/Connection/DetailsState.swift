//
//  DetailsState.swift
//  Example
//
//  Created by Kristóf Kálai on 04/03/2024.
//

import TheAsyncArchitecture

struct DetailsState {
    let title: String
}

extension DetailsState: Defaultable {
    static var `default`: Self {
        .init(title: .init())
    }
}

extension DetailsState: Equatable {}

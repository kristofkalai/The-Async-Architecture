//
//  MainState.swift
//  Example
//
//  Created by Kristóf Kálai on 04/03/2024.
//

import TheAsyncArchitecture

struct MainState {
    let items: [MainItem]
}

extension MainState: Defaultable {
    static var `default`: Self {
        .init(items: [.init(title: "Empty state, please wait...")])
    }
}

extension MainState: Equatable {}

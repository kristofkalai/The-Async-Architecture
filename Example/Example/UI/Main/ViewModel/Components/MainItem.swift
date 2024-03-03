//
//  MainItem.swift
//  Example
//
//  Created by Kristóf Kálai on 04/03/2024.
//

struct MainItem {
    let title: String
}

extension MainItem: Equatable {}

extension MainItem: Identifiable {
    var id: String {
        title
    }
}

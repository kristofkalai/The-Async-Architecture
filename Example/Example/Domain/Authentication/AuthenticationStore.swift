//
//  AuthenticationStore.swift
//  Example
//
//  Created by Kristóf Kálai on 04/03/2024.
//

import Combine

public protocol AuthenticationStore {
    var state: AnyPublisher<AuthenticationState, Never> { get }
}

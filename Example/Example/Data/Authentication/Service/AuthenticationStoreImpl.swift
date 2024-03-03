//
//  AuthenticationStoreImpl.swift
//  Example
//
//  Created by Kristóf Kálai on 04/03/2024.
//

import Combine
import Resolver

final class AuthenticationStoreImpl {
    @LazyInjected private var cache: AuthenticationCache
}

extension AuthenticationStoreImpl: AuthenticationStore {
    var state: AnyPublisher<AuthenticationState, Never> {
        cache.value().compactMap { $0 }.eraseToAnyPublisher()
    }
}

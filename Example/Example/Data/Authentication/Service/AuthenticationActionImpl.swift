//
//  AuthenticationActionImpl.swift
//  Example
//
//  Created by Kristóf Kálai on 04/03/2024.
//

import Resolver
import Foundation

final class AuthenticationActionImpl {
    @LazyInjected private var cache: AuthenticationCache
}

extension AuthenticationActionImpl: AuthenticationAction {
    func authenticate() async throws {
        try await Task.sleep(nanoseconds: UInt64(2 * TimeInterval(NSEC_PER_SEC)))
        cache.save(item: .loggedIn)
    }
}

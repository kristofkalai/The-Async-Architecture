//
//  MockAuthenticationService.swift
//  Example
//
//  Created by Kristóf Kálai on 04/03/2024.
//

import Combine
import Foundation

final class MockAuthenticationService {
    private let cache = PassthroughSubject<AuthenticationState, Never>()
}

extension MockAuthenticationService: AuthenticationStore {
    var state: AnyPublisher<AuthenticationState, Never> {
        cache.eraseToAnyPublisher()
    }
}

extension MockAuthenticationService: AuthenticationAction {
    func authenticate() async throws {
        try await Task.sleep(nanoseconds: UInt64(2 * TimeInterval(NSEC_PER_SEC)))
        cache.send(.loggedIn)
    }
}

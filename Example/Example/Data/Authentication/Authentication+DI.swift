//
//  Authentication+DI.swift
//  Example
//
//  Created by Kristóf Kálai on 04/03/2024.
//

import Resolver

extension Resolver {
    static func registerAuthentication() {
        registerAuthenticationService()
    }
}

extension Resolver {
    private static func registerAuthenticationService() {
#if MOCK
        register { MockAuthenticationService() }
            .implements(AuthenticationStore.self)
            .implements(AuthenticationAction.self)
            .scope(.application)
#else
        register { AuthenticationStoreImpl() }
            .implements(AuthenticationStore.self)
            .scope(.application)

        register { AuthenticationActionImpl() }
            .implements(AuthenticationAction.self)
            .scope(.application)

        register { AuthenticationCache() }
            .scope(.application)
#endif
    }
}

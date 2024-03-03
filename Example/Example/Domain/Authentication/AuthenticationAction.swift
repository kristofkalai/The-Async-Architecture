//
//  AuthenticationAction.swift
//  Example
//
//  Created by Kristóf Kálai on 04/03/2024.
//

public protocol AuthenticationAction {
    func authenticate() async throws
}

//
//  Parametrizable.swift
//
//
//  Created by Kristóf Kálai on 02/03/2024.
//

public protocol Parametrizable {
    associatedtype ParamType: NavigationParameter
    func set(parameter: ParamType)
}

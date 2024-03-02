//
//  Cache.swift
//
//
//  Created by Kristóf Kálai on 02/03/2024.
//

import Combine

open class Cache<Item> {
    private let cache: CurrentValueSubject<Item?, Never>

    public init(defaultValue: Item? = nil) {
        cache = .init(defaultValue)
    }

    open var immediateValue: Item? {
        cache.value
    }

    open func clear() {
        cache.send(nil)
    }

    open func save(item: Item) {
        cache.send(item)
    }

    open func value() -> AnyPublisher<Item?, Never> {
        cache.eraseToAnyPublisher()
    }
}

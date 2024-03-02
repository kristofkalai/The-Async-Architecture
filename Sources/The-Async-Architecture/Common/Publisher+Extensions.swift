//
//  Publisher+Extensions.swift
//
//
//  Created by Kristóf Kálai on 02/03/2024.
//

import Combine

extension Publisher where Failure == Never {
    func asyncSink(_ receiveValue: @escaping (Output) async -> Void) -> AnyCancellable {
        sink { value in
            Task {
                await receiveValue(value)
            }
        }
    }
}

extension Publisher {
    func asyncSink(
        _ receiveCompletion: @escaping (Subscribers.Completion<Failure>) async -> Void,
        _ receiveValue: @escaping (Output) async -> Void
    ) -> AnyCancellable {
        sink { completion in
            Task {
                await receiveCompletion(completion)
            }
        } receiveValue: { value in
            Task {
                await receiveValue(value)
            }
        }
    }

    func asyncMap<T>(_ transform: @escaping (Output) async -> T) -> Publishers.FlatMap<Future<T, Never>, Self> {
        flatMap { value in
            Future {
                await transform(value)
            }
        }
    }

    func asyncMap<T>(_ transform: @escaping (Output) async throws -> T) -> Publishers.FlatMap<Future<T, Error>, Self> {
        flatMap { value in
            Future {
                try await transform(value)
            }
        }
    }
}

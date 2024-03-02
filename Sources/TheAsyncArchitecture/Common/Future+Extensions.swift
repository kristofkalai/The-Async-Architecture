//
//  Future+Extensions.swift
//
//
//  Created by Kristóf Kálai on 02/03/2024.
//

import Combine

extension Future {
    public convenience init(block: @escaping () async -> Output) {
        self.init { promise in
            Task {
                let output = await block()
                promise(.success(output))
            }
        }
    }
}

extension Future where Failure == Error {
    public convenience init(block: @escaping () async throws -> Output) {
        self.init { promise in
            Task {
                do {
                    let output = try await block()
                    promise(.success(output))
                } catch {
                    promise(.failure(error))
                }
            }
        }
    }
}

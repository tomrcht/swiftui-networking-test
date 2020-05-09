//
//  Agent.swift
//  networking
//
//  Created by Tom Rochat on 01/04/2020.
//  Copyright © 2020 Tom Rochat. All rights reserved.
//

import Foundation
import Combine

final class Agent {
    private let decoder = JSONDecoder()

    public func run<T>(_ request: URLRequest) -> AnyPublisher<T, Error> where T: Decodable {
        URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .tryMap({ output in
                guard let response = output.response as? HTTPURLResponse else {
                    throw NetworkError.empty
                }

                if !(200...299 ~= response.statusCode) {
                    let error = try self.decoder.decode(GithubApi.GithubError.self, from: output.data)
                    throw NetworkError.github(error.message)
                }

                let data = try self.decoder.decode(T.self, from: output.data)
                return data
            })
            .eraseToAnyPublisher()
    }

    // MARK: - Errors
    enum NetworkError: LocalizedError {
        case empty
        case github(String)

        public var errorDescription: String? {
            switch self {
            case .empty:
                return "The API returned an empty response"
            case .github(let message):
                return message
            }
        }
    }
}

//
//  GithubApi.swift
//  networking
//
//  Created by Tom Rochat on 01/04/2020.
//  Copyright © 2020 Tom Rochat. All rights reserved.
//

import Foundation
import Combine

enum GithubApi {
    static let agent = Agent()
    static let base = URL(string: "https://api.github.com")!

    public struct GithubError: Decodable {
        public let message: String
    }
}

// MARK: - GET METHODS
extension GithubApi {
    static func tomrcht() -> AnyPublisher<GithubUser, Error> {
        agent.run(URLRequest(url: base.appendingPathComponent("users/tomrchtt")))
    }
}

//
//  GithubUser.swift
//  networking
//
//  Created by Tom Rochat on 01/04/2020.
//  Copyright © 2020 Tom Rochat. All rights reserved.
//

import Foundation

struct GithubUser: Codable, Identifiable {
    public var id: Int
    public var login: String
    public var avatarUrl: String
    public var siteAdmin: Bool

    enum CodingKeys: String, CodingKey {
        case id, login
        case avatarUrl = "avatar_url"
        case siteAdmin = "site_admin"
    }
}

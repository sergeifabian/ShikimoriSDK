//
//  AccessToken.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Foundation

struct AccessToken: Codable {
    let accessToken: String
    let refreshToken: String
    let createdAt: Date
    let expiresAt: Date
    let tokenType: String
    let scope: String

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        accessToken = try container.decode(String.self, forKey: .accessToken)
        refreshToken = try container.decode(String.self, forKey: .refreshToken)
        createdAt = try container.decodeUnixDate(for: .createdAt)
        expiresAt = try container.decodeUnixDateWithInterval(for: .expiresAt, since: createdAt)
        tokenType = try container.decode(String.self, forKey: .tokenType)
        scope = try container.decode(String.self, forKey: .scope)
    }

    enum CodingKeys: String, CodingKey {
        case accessToken
        case refreshToken
        case createdAt
        case expiresAt = "expiresIn"
        case tokenType
        case scope
    }
}

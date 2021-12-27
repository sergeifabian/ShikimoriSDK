//
//  Genre.swift
//  
//
//  Created by Sergei Fabian on 27.12.2021.
//

import Foundation

public struct Genre: Identifiable, Hashable, Codable {
    public let id: Int
    public let name: String
    public let nameRu: String
    public let kind: Kind

    public enum Kind: String, Codable {
        case anime, manga
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case nameRu = "russian"
        case kind
    }
}

//
//  AnimeListStatus.swift
//  
//
//  Created by Sergei Fabian on 27.12.2021.
//

import Foundation

public enum AnimeListStatus: String, Codable {
    case planned
    case watching
    case rewatching
    case completed
    case onHold = "on_hold"
    case dropped
}

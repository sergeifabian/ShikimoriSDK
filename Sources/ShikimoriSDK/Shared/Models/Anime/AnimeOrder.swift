//
//  AnimeOrder.swift
//  
//
//  Created by Sergei Fabian on 27.12.2021.
//

import Foundation

public enum AnimeOrder: String, Encodable {
    case id
    case ranked
    case kind
    case popularity
    case name
    case airedOn = "aired_on"
    case episodes
    case status
    case random
}

//
//  AnimeDuration.swift
//  
//
//  Created by Sergei Fabian on 27.12.2021.
//

import Foundation

public enum AnimeDuration: String, Encodable {
    /// Меньше 10 минут
    case s
    /// Меньше 30 минут
    case d
    /// Больше 30 минут
    case f
}

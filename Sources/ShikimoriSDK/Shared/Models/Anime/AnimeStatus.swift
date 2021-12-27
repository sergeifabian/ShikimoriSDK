//
//  AnimeStatus.swift
//  
//
//  Created by Sergei Fabian on 27.12.2021.
//

import Foundation

public enum AnimeStatus: String, Encodable {
    /// Анонсировано
    case anons
    /// Выходит
    case ongoing
    /// Завершено
    case released
}

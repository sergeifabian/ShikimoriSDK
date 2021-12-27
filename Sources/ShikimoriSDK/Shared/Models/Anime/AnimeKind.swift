//
//  AnimeKind.swift
//  
//
//  Created by Sergei Fabian on 27.12.2021.
//

import Foundation

public enum AnimeKind: String, Encodable {
    /// TV сериал
    case tv
    /// Фильм
    case movie
    /// OVA
    case ova
    /// ONA
    case ona
    /// Специальный выпуск
    case special
    /// Клип
    case music
    /// Короткие ~13 серий
    case tv13 = "tv_13"
    /// Короткие ~24 серий
    case tv24 = "tv_24"
    /// Короткие ~48 серий
    case tv48 = "tv_48"
}

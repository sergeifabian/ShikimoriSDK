//
//  Rating.swift
//  
//
//  Created by Sergei Fabian on 27.12.2021.
//

import Foundation

public enum Rating: String, Encodable {
    /// Без рейтинга
    case none
    /// Нет возрастных ограничений
    case g
    /// Рекомендуется присутствие родителей
    case pg
    /// Детям до 13 лет просмотр не желателен
    case pg13 = "pg_13"
    /// Лицам до 17 лет обязательно присутствие взрослого
    case r
    /// Лицам до 17 лет просмотр запрещен
    case rPlus = "r_plus"
    /// Хентай
    case rx
}

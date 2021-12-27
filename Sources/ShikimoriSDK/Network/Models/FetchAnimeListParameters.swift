//
//  FetchAnimeListParameters.swift
//  
//
//  Created by Sergei Fabian on 27.12.2021.
//

import Foundation

public struct FetchAnimeListParameters: Encodable {
    /// Номер блока по заданным критериям
    public let page: Int?
    /// Количество элементов в блоке
    public let limit: Int?
    /// Сортировка
    public let order: AnimeOrder?
    /// Тип
    public let kind: AnimeKind?
    /// Статус
    public let status: AnimeStatus?
    /// Минимальный рейтинг
    public let score: Int?
    /// Продолжительность серий
    public let duration: AnimeDuration?
    /// Жанр
    public let genre: [Genre.ID]?
    /// Стоит ли фильтровать с учетом цензуры
    public let censored: Bool?
    /// Элементы из списка пользователя по типу
    public let mylist: AnimeListStatus?
    /// Ключевое слово в названии
    public let search: String?

    public init(
        page: Int? = nil,
        limit: Int? = nil,
        order: AnimeOrder? = nil,
        kind: AnimeKind? = nil,
        status: AnimeStatus? = nil,
        score: Int? = nil,
        duration: AnimeDuration? = nil,
        genre: [Genre.ID]? = nil,
        censored: Bool? = nil,
        mylist: AnimeListStatus? = nil,
        search: String = nil?
    ) {
        self.page = page
        self.limit = limit
        self.order = order
        self.kind = kind
        self.status = status
        self.score = score
        self.duration = duration
        self.genre = genre
        self.censored = censored
        self.mylist = mylist
        self.search = search
    }
}

//
//  AnimeTarget.swift
//  
//
//  Created by Sergei Fabian on 27.12.2021.
//

import Moya

enum AnimeTarget: SubTarget {
    case fetchAnimeList(parameters: FetchAnimeListParameters)

    var path: String {
        switch self {
        case .fetchAnimeList:
            return "animes"
        }
    }

    var method: Method {
        switch self {
        case .fetchAnimeList:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .fetchAnimeList(parameters: let parameters):
            return .requestParameters(parameters: parameters.asDictionary, encoding: URLEncoding.queryString)
        }
    }
}

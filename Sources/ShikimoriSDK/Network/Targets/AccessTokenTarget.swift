//
//  AccessTokenTarget.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Moya

enum AccessTokenTarget: SubTarget {
    case fetchAccessToken(parameters: FetchAccessTokenParameters)
    case refreshAccessToken(parameters: RefreshAccessTokenParameters)

    var path: String {
        switch self {
        case .fetchAccessToken, .refreshAccessToken:
            return "oauth/token"
        }
    }

    var method: Method {
        switch self {
        case .fetchAccessToken, .refreshAccessToken:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .fetchAccessToken(let parameters):
            return .requestCustomJSONEncodable(parameters, encoder: .backendEncoder)
        case .refreshAccessToken(let parameters):
            return .requestCustomJSONEncodable(parameters, encoder: .backendEncoder)
        }
    }
}

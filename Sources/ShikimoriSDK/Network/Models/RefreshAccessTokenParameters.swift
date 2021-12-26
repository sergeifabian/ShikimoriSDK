//
//  RefreshAccessTokenParameters.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Foundation

struct RefreshAccessTokenParameters: Encodable {
    let grantType = "refresh_token"
    let clientId: String
    let clientSecret: String
    let refreshToken: String

    init(configuration: ShikimoriConfiguration, refreshToken: String) {
        self.clientId = configuration.clientId
        self.clientSecret = configuration.clientSecret
        self.refreshToken = refreshToken
    }
}

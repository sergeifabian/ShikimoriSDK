//
//  FetchAccessTokenParameters.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Foundation

struct FetchAccessTokenParameters: Encodable {
    let grantType = "authorization_code"
    let clientId: String
    let clientSecret: String
    let redirectUri: String
    let code: String

    init(configuration: ShikimoriConfiguration, code: String) {
        self.clientId = configuration.clientId
        self.clientSecret = configuration.clientSecret
        self.redirectUri = configuration.redirectUri
        self.code = code
    }
}

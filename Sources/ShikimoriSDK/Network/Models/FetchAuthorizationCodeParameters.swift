//
//  FetchAuthorizationCodeParameters.swift
//  
//
//  Created by Sergei Fabian on 27.12.2021.
//

import Foundation

struct FetchAuthorizationCodeParameters {
    let url: URL
    let callbackURLScheme: String

    init(configuration: ShikimoriConfiguration) {
        self.url = configuration.authorizationUrl
        self.callbackURLScheme = configuration.callbackURLScheme
    }
}

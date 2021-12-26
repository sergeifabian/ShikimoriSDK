//
//  AuthorizationCode.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Foundation

struct AuthorizationCode {
    let url: URL
    let code: String

    init?(url: URL) {
        guard
            let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
            let codeItem = components.queryItems?.first(where: { $0.name == "code" }),
            let code = codeItem.value
        else {
            return nil
        }

        self.url = url
        self.code = code
    }
}

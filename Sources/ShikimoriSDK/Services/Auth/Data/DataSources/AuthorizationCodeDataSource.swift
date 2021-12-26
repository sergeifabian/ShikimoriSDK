//
//  AuthorizationCodeDataSource.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Foundation

enum AuthorizationCodeError: Error {
    case invalidRedirectURL(URL)
}

protocol AuthorizationCodeDataSourceType {
    func fetchAuthorizationCode(parameters: FetchAuthorizationCodeParameters) async throws -> AuthorizationCode
}

final class AuthorizationCodeDataSource: AuthorizationCodeDataSourceType {

    private let authorizationController: AuthorizationControllerType

    init(authorizationController: AuthorizationControllerType) {
        self.authorizationController = authorizationController
    }

    func fetchAuthorizationCode(parameters: FetchAuthorizationCodeParameters) async throws -> AuthorizationCode {
        let url = parameters.url
        let callbackURLScheme = parameters.callbackURLScheme
        let redirectUrl = try await authorizationController.authorize(url: url, callbackURLScheme: callbackURLScheme)

        guard let authorizationCode = AuthorizationCode(url: redirectUrl) else {
            throw AuthorizationCodeError.invalidRedirectURL(redirectUrl)
        }

        return authorizationCode
    }
}

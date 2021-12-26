//
//  AuthorizationCodeRepository.swift
//  
//
//  Created by Sergei Fabian on 27.12.2021.
//

import Foundation

protocol AuthorizationCodeRepositoryType {
    func fetchAuthorizationCode(parameters: FetchAuthorizationCodeParameters) async throws -> AuthorizationCode
}

final class AuthorizationCodeRepository: AuthorizationCodeRepositoryType {

    private let authorizationCodeDataSource: AuthorizationCodeDataSourceType

    init(authorizationCodeDataSource: AuthorizationCodeDataSourceType) {
        self.authorizationCodeDataSource = authorizationCodeDataSource
    }

    func fetchAuthorizationCode(parameters: FetchAuthorizationCodeParameters) async throws -> AuthorizationCode {
        try await authorizationCodeDataSource.fetchAuthorizationCode(parameters: parameters)
    }
}

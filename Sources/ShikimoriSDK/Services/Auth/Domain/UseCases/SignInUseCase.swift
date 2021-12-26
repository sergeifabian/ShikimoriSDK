//
//  SignInUseCase.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Foundation

protocol SignInUseCaseType {
    func execute() async throws
}

final class SignInUseCase: SignInUseCaseType {

    private let configuration: ShikimoriConfiguration
    private let accessTokenReposity: AccessTokenRepositoryType
    private let authorizationCodeRepository: AuthorizationCodeRepositoryType

    init(
        configuration: ShikimoriConfiguration,
        accessTokenReposity: AccessTokenRepositoryType,
        authorizationCodeRepository: AuthorizationCodeRepositoryType
    ) {
        self.configuration = configuration
        self.accessTokenReposity = accessTokenReposity
        self.authorizationCodeRepository = authorizationCodeRepository
    }

    func execute() async throws {
        let fetchAuthorizationCodeParameters = FetchAuthorizationCodeParameters(configuration: configuration)
        let authorizationCode = try await authorizationCodeRepository.fetchAuthorizationCode(parameters: fetchAuthorizationCodeParameters)
        let requestAccessTokenParameters = RequestAccessTokenParameters(configuration: configuration, code: authorizationCode.code)
        try await accessTokenReposity.requestAccessToken(parameters: requestAccessTokenParameters)
    }
}

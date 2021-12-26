//
//  SignOutUseCase.swift
//  
//
//  Created by Sergei Fabian on 27.12.2021.
//

import Foundation

protocol SignOutUseCaseType {
    func execute() throws
}

final class SignOutUseCase: SignOutUseCaseType {

    private let accessTokenRepository: AccessTokenRepositoryType

    init(accessTokenRepository: AccessTokenRepositoryType) {
        self.accessTokenRepository = accessTokenRepository
    }

    func execute() throws {
        try accessTokenRepository.resetAccessToken()
    }
}

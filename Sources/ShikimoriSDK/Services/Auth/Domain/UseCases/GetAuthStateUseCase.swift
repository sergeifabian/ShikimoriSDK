//
//  GetAuthStateUseCase.swift
//
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Foundation

protocol GetAuthStateUseCaseType {
    func execute() -> AuthState
}

final class GetAuthStateUseCase: GetAuthStateUseCaseType {

    private let authStateRepository: AuthStateRepositoryType

    init(authStateRepository: AuthStateRepositoryType) {
        self.authStateRepository = authStateRepository
    }

    func execute() -> AuthState {
        authStateRepository.getAuthState()
    }
}

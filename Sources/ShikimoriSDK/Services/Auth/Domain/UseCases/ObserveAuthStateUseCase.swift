//
//  ObserveAuthStateUseCase.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Combine

protocol ObserveAuthStateUseCaseType {
    func execute() -> AnyPublisher<AuthState, Never>
}

final class ObserveAuthStateUseCase: ObserveAuthStateUseCaseType {

    private let authStateRepository: AuthStateRepositoryType

    init(authStateRepository: AuthStateRepositoryType) {
        self.authStateRepository = authStateRepository
    }

    func execute() -> AnyPublisher<AuthState, Never> {
        authStateRepository.observeAuthState()
    }
}

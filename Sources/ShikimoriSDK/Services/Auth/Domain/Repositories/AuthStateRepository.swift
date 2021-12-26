//
//  AuthStateRepository.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Combine

protocol AuthStateRepositoryType {
    func getAuthState() -> AuthState
    func observeAuthState() -> AnyPublisher<AuthState, Never>
}

final class AuthStateRepository: AuthStateRepositoryType {

    private let authStateDataSource: AuthStateDataSourceType

    init(authStateDataSource: AuthStateDataSourceType) {
        self.authStateDataSource = authStateDataSource
    }

    func getAuthState() -> AuthState {
        authStateDataSource.getAuthState()
    }

    func observeAuthState() -> AnyPublisher<AuthState, Never> {
        authStateDataSource.observeAuthState()
    }
}

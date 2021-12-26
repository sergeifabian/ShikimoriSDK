//
//  AuthStateDataSource.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Combine

protocol AuthStateDataSourceType {
    func getAuthState() -> AuthState
    func observeAuthState() -> AnyPublisher<AuthState, Never>
    func setAuthState(_ authState: AuthState)
}

final class AuthStateDataSource: AuthStateDataSourceType {

    private let publisher: CurrentValueSubject<AuthState, Never>

    private let keychainStorage: KeychainStorageType

    init(keychainStorage: KeychainStorageType) {
        self.keychainStorage = keychainStorage

        do {
            let containsAccessToken = try keychainStorage.contains(forKey: .accessToken)
            publisher = CurrentValueSubject(containsAccessToken ? .signedIn : .signedOut)
        } catch {
            assertionFailure(error.localizedDescription)
            publisher = CurrentValueSubject(.signedOut)
        }
    }

    func getAuthState() -> AuthState {
        publisher.value
    }

    func observeAuthState() -> AnyPublisher<AuthState, Never> {
        publisher.eraseToAnyPublisher()
    }

    func setAuthState(_ authState: AuthState) {
        publisher.send(authState)
    }
}


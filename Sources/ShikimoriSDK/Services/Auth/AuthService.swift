//
//  AuthService.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Combine

public protocol AuthServiceType {

    /// Возвращает состояние авторизации, а именно индикатор наличия токена авторизации
    func getAuthState() -> AuthState

    /// Возвращает объект, на который можно подписаться, который будет уведомлять, когда состояние авторизации изменится
    func observeAuthState() -> AnyPublisher<AuthState, Never>

    /// Метод авторизации на сервисе Shikimori, инициирующий полный путь для пользователя
    func signIn() async throws

    /// Метод выхода из сервиса Shikimori, инициирующий удаление токена авторизации
    func signOut() throws
}

final class AuthService: AuthServiceType {

    private let getAuthStateUseCase: GetAuthStateUseCaseType
    private let observeAuthStateUseCase: ObserveAuthStateUseCaseType
    private let signInUseCase: SignInUseCaseType
    private let signOutUseCase: SignOutUseCaseType

    init(
        getAuthStateUseCase: GetAuthStateUseCaseType,
        observeAuthStateUseCase: ObserveAuthStateUseCaseType,
        signInUseCase: SignInUseCaseType,
        signOutUseCase: SignOutUseCaseType
    ) {
        self.getAuthStateUseCase = getAuthStateUseCase
        self.observeAuthStateUseCase = observeAuthStateUseCase
        self.signInUseCase = signInUseCase
        self.signOutUseCase = signOutUseCase
    }

    func getAuthState() -> AuthState {
        getAuthStateUseCase.execute()
    }

    func observeAuthState() -> AnyPublisher<AuthState, Never> {
        observeAuthStateUseCase.execute()
    }

    func signIn() async throws {
        try await signInUseCase.execute()
    }

    func signOut() throws {
        try signOutUseCase.execute()
    }
}

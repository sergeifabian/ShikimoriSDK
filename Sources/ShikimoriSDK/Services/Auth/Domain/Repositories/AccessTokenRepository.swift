//
//  AccessTokenRepository.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Foundation

typealias RequestAccessTokenParameters = FetchAccessTokenParameters

protocol AccessTokenRepositoryType {
    func getAccessToken() throws -> AccessToken?
    func requestAccessToken(parameters: RequestAccessTokenParameters) async throws
    func refreshAccessToken(parameters: RefreshAccessTokenParameters) async throws
    func resetAccessToken() throws
}

final class AccessTokenRepository: AccessTokenRepositoryType {

    private let accessTokenLocalDataSource: AccessTokenLocalDataSourceType
    private let accessTokenRemoteDataSource: AccessTokenRemoteDataSourceType
    private let authStateDataSource: AuthStateDataSourceType

    init(
        accessTokenLocalDataSource: AccessTokenLocalDataSourceType,
        accessTokenRemoteDataSource: AccessTokenRemoteDataSourceType,
        authStateDataSource: AuthStateDataSourceType
    ) {
        self.accessTokenLocalDataSource = accessTokenLocalDataSource
        self.accessTokenRemoteDataSource = accessTokenRemoteDataSource
        self.authStateDataSource = authStateDataSource
    }

    func getAccessToken() throws -> AccessToken? {
        try accessTokenLocalDataSource.getAccessToken()
    }

    func requestAccessToken(parameters: RequestAccessTokenParameters) async throws {
        let accessToken = try await accessTokenRemoteDataSource.fetchAccessToken(parameters: parameters)
        try accessTokenLocalDataSource.setAccessToken(accessToken)
        authStateDataSource.setAuthState(.signedIn)
    }

    func refreshAccessToken(parameters: RefreshAccessTokenParameters) async throws {
        let accessToken = try await accessTokenRemoteDataSource.refreshAccessToken(parameters: parameters)
        try accessTokenLocalDataSource.setAccessToken(accessToken)
        authStateDataSource.setAuthState(.signedIn)
    }

    func resetAccessToken() throws {
        try accessTokenLocalDataSource.removeAccessToken()
        authStateDataSource.setAuthState(.signedOut)
    }
}

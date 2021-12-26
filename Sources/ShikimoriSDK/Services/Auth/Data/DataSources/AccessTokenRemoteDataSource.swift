//
//  AccessTokenRemoteDataSource.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Foundation

protocol AccessTokenRemoteDataSourceType {
    func fetchAccessToken(parameters: FetchAccessTokenParameters) async throws -> AccessToken
    func refreshAccessToken(parameters: RefreshAccessTokenParameters) async throws -> AccessToken
}

final class AccessTokenRemoteDataSource: AccessTokenRemoteDataSourceType {

    private let accessTokenTargetProvider: AccessTokenTargetProvider

    init(accessTokenTargetProvider: AccessTokenTargetProvider) {
        self.accessTokenTargetProvider = accessTokenTargetProvider
    }

    func fetchAccessToken(parameters: FetchAccessTokenParameters) async throws -> AccessToken {
        try await accessTokenTargetProvider.request(.fetchAccessToken(parameters: parameters))
    }

    func refreshAccessToken(parameters: RefreshAccessTokenParameters) async throws -> AccessToken {
        try await accessTokenTargetProvider.request(.refreshAccessToken(parameters: parameters))
    }
}

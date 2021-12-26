//
//  AccessTokenLocalDataSource.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Foundation

protocol AccessTokenLocalDataSourceType {
    func getAccessToken() throws -> AccessToken?
    func setAccessToken(_ accessToken: AccessToken) throws
    func removeAccessToken() throws
}

final class AccessTokenLocalDataSource: AccessTokenLocalDataSourceType {

    private let keychainStorage: KeychainStorageType

    init(keychainStorage: KeychainStorageType) {
        self.keychainStorage = keychainStorage
    }

    func getAccessToken() throws -> AccessToken? {
        try keychainStorage.get(forKey: .accessToken, valueType: AccessToken.self)
    }

    func setAccessToken(_ accessToken: AccessToken) throws {
        try keychainStorage.set(accessToken, forKey: .accessToken)
    }

    func removeAccessToken() throws {
        try keychainStorage.remove(forKey: .accessToken)
    }
}

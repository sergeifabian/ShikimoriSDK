//
//  KeychainStorage.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Foundation
import KeychainAccess

protocol KeychainStorageType {
    func get<T: Decodable>(forKey key: KeychainKey, valueType: T.Type) throws -> T?
    func set<T: Encodable>(_ value: T, forKey key: KeychainKey) throws
    func remove(forKey key: KeychainKey) throws
    func contains(forKey key: KeychainKey) throws -> Bool
}

final class KeychainStorage: KeychainStorageType {

    private let keychain: Keychain

    private let lock = NSLock()

    init(keychain: Keychain) {
        self.keychain = keychain
    }

    func get<T: Decodable>(forKey key: KeychainKey, valueType: T.Type) throws -> T? {
        lock.lock(); defer { lock.unlock() }

        if let data = try keychain.getData(key.value) {
            return try JSONDecoder.default.decode(T.self, from: data)
        } else {
            return nil
        }
    }

    func set<T: Encodable>(_ value: T, forKey key: KeychainKey) throws {
        lock.lock(); defer { lock.unlock() }
        let data = try JSONEncoder.default.encode(value)
        try keychain.set(data, key: key.value)
    }

    func remove(forKey key: KeychainKey) throws {
        lock.lock(); defer { lock.unlock() }
        try keychain.remove(key.value)
    }

    func contains(forKey key: KeychainKey) throws -> Bool {
        lock.lock(); defer { lock.unlock() }
        return try keychain.contains(key.value)
    }
}

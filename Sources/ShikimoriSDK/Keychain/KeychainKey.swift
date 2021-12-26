//
//  KeychainKey.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Foundation

struct KeychainKey {
    let value: String
}

extension KeychainKey {
    static var accessToken: KeychainKey {
        KeychainKey(value: IdentifierBuilder.create(context: "keychain", key: "accessToken"))
    }
}

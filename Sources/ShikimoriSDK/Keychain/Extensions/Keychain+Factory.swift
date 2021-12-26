//
//  Keychain+Factory.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Foundation
import KeychainAccess

extension Keychain {
    static func build() -> Keychain {
        Keychain(service: IdentifierBuilder.create(context: "keychain"))
    }
}

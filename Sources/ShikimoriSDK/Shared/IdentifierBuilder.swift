//
//  IdentifierBuilder.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Foundation

struct IdentifierBuilder {
    static func create(context: String? = nil, key: String? = nil) -> String {
        var identifier = "com.ssrapid.shikimori"

        if let context = context {
            identifier.append(".\(context)")
        }

        if let key = key {
            identifier.append(".\(key)")
        }

        return identifier
    }
}

//
//  Encodable+Ext.swift
//  
//
//  Created by Sergei Fabian on 27.12.2021.
//

import Foundation

extension Encodable {
    var asDictionary: [String: Any] {
        do {
            let data = try JSONEncoder.backendEncoder.encode(self)

            if let result = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] {
                return result
            } else {
                assertionFailure("Can't convert object to dictionary. Object: \(self)")
                return [:]
            }
        } catch {
            assertionFailure(error.localizedDescription)
            return [:]
        }
    }
}

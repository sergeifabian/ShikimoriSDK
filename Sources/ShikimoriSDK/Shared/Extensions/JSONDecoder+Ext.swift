//
//  JSONDecoder+Ext.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Foundation

extension JSONDecoder {

    static var `default`: JSONDecoder { JSONDecoder() }

    static var backendDecoder: JSONDecoder {
        let decoder = Self.default
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}

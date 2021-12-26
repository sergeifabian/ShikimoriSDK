//
//  JSONEncoder+Ext.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Foundation

extension JSONEncoder {
    
    static var `default`: JSONEncoder { JSONEncoder() }
    
    static var backendDecoder: JSONEncoder {
        let encoder = Self.default
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }
}

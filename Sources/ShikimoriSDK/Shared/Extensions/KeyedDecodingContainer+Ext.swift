//
//  KeyedDecodingContainer+Ext.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Foundation

extension KeyedDecodingContainer {
    
    func decodeUnixDate(for key: Key) throws -> Date {
        let timeInterval = try decode(TimeInterval.self, forKey: key)
        return Date(timeIntervalSince1970: timeInterval)
    }

    func decodeUnixDateWithInterval(for key: Key, since date: Date) throws -> Date {
        let timeInterval = try decode(TimeInterval.self, forKey: key)
        return date.addingTimeInterval(timeInterval)
    }
}

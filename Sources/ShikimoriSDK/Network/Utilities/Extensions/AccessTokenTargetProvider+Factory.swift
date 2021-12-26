//
//  AccessTokenTargetProvider+Factory.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Foundation

typealias AccessTokenTargetProvider = DynamicProvider<AccessTokenTarget>

extension AccessTokenTargetProvider {
    static func build(configuration: ShikimoriConfiguration) -> AccessTokenTargetProvider {
        AccessTokenTargetProvider(baseUrl: configuration.domainUrl, headers: configuration.headers)
    }
}

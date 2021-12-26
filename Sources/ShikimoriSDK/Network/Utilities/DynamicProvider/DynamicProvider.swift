//
//  DynamicProvider.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Foundation
import Moya

class DynamicProvider<Target: SubTarget>: MoyaProvider<DynamicTarget> {

    let baseUrl: URL
    let headers: [String: String]?

    init(baseUrl: URL, headers: [String: String]?) {
        self.baseUrl = baseUrl
        self.headers = headers
    }

    func request<R: Decodable>(_ subTarget: Target, resultType: R.Type = R.self) async throws -> R {
        try await withCheckedThrowingContinuation { continuation in
            super.request(DynamicTarget(baseURL: baseUrl, headers: headers, subTarget: subTarget)) { result in
                switch result {
                case .success(let response):
                    do {
                        continuation.resume(returning: try response.map(R.self, using: .backendDecoder))
                    } catch {
                        continuation.resume(throwing: error)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}

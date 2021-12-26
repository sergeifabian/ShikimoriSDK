//
//  AuthorizationController.swift
//  
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Foundation
import AuthenticationServices

enum AuthorizationError: Error {
    case invalidSession
    case invalidSessionCompletionParameters
}

protocol AuthorizationControllerType {
    func authorize(url: URL, callbackURLScheme: String) async throws -> URL
}

final class AuthorizationController: NSObject, AuthorizationControllerType {

    func authorize(url: URL, callbackURLScheme: String) async throws -> URL {
        try await withCheckedThrowingContinuation { continuation in
            let session = ASWebAuthenticationSession(url: url, callbackURLScheme: callbackURLScheme) { url, error in
                if let url = url {
                    continuation.resume(returning: url)
                } else if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(throwing: AuthorizationError.invalidSessionCompletionParameters)
                }
            }

            session.presentationContextProvider = self
            session.prefersEphemeralWebBrowserSession = true

            if session.canStart {
                session.start()
            } else {
                continuation.resume(throwing: AuthorizationError.invalidSession)
            }
        }
    }
}

// MARK: - ASWebAuthenticationPresentationContextProviding

extension AuthorizationController: ASWebAuthenticationPresentationContextProviding {
    public func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        ASPresentationAnchor()
    }
}

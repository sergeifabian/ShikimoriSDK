//
//  ShikimoriConfiguration.swift
//
//
//  Created by Sergei Fabian on 26.12.2021.
//

import Foundation

public struct ShikimoriConfiguration {
    let scheme: String
    let host: String
    let authorizationPath: String
    let authenticationPath: String
    let apiPath: String
    let appName: String
    let clientId: String
    let clientSecret: String
    let redirectUri: String
    let scopes: String

    var domainUrl: URL {
        createUrl()
    }

    var authorizationUrl: URL {
        createUrl(
            path: authorizationPath,
            parameters: [
                "client_id": clientId,
                "redirect_uri": redirectUri,
                "response_type": "code"
            ]
        )
    }

    var apiUrl: URL {
        createUrl(path: apiPath)
    }

    var headers: [String: String] {
        ["User-Agent": appName, "Content-Type": "application/json"]
    }

    var callbackURLScheme: String {
        URLComponents(string: redirectUri)?.scheme ?? ""
    }

    public init(
        scheme: String = "https",
        host: String = "shikimori.one",
        authorizationPath: String = "/oauth/authorize",
        authenticationPath: String = "/oauth/token",
        apiPath: String = "/api",
        appName: String,
        clientId: String,
        clientSecret: String,
        redirectUri: String,
        scopes: [Scope] = []
    ) {
        self.scheme = scheme
        self.host = host
        self.authorizationPath = authorizationPath
        self.authenticationPath = authenticationPath
        self.apiPath = apiPath
        self.appName = appName
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.redirectUri = redirectUri
        self.scopes = scopes.asParameter
    }

    private func createUrl(path: String? = nil, parameters: [String: String]? = nil) -> URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host

        if let path = path {
            components.path = path
        }

        if let parameters = parameters {
            components.queryItems = parameters.map(URLQueryItem.init)
        }

        guard let url = components.url else {
            assertionFailure("Can't create URL with configuration: \(self)")
            return URL(fileURLWithPath: "")
        }

        return url
    }
}

public extension ShikimoriConfiguration {

    enum Scope: String {

        /// Изменять твой список аниме и манги
        case userRates = "user_rates"

        /// Получать твой почтовый адрес (email)
        case email

        /// Читать твои личные сообщения, отправлять личные сообщения от твоего имени
        case messages

        /// Комментировать от твоего имени
        case comments

        /// Создавать топики и рецензии от твоего имени
        case topics

        /// Изменять базу данных сайта
        case content

        /// Вступать и выходить из клубов
        case clubs

        /// Добавлять и удалять людей в друзья
        case friends

        /// Добавлять и удалять людей в игнор
        case ignores
    }
}

private extension Array where Element == ShikimoriConfiguration.Scope {
    var asParameter: String { map({ $0.rawValue }).joined(separator: "+") }
}

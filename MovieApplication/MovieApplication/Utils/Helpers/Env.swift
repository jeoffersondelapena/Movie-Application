//
//  Env.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import Foundation

struct Env {
    private struct Key {
        static _const let apiKey = "API_KEY"
        static _const let baseURL = "BASE_URL"
        static _const let baseURLImage = "BASE_URL_IMAGE"
    }

    private static let infoDictionary: [String: Any] = {
        guard let infoDictionary = Bundle.main.infoDictionary else {
            fatalError("plist file not found")
        }
        return infoDictionary
    }()

    static let apiKey: String = {
        guard let apiKey = Env.infoDictionary[Key.apiKey] as? String else {
            fatalError(notSetInPlistErrorMessage(Key.apiKey))
        }
        return apiKey
    }()

    static let baseURL: URL = {
        guard let baseURLString = Env.infoDictionary[Key.baseURL] as? String else {
            fatalError(notSetInPlistErrorMessage(Key.baseURL))
        }
        guard let baseURL = URL(string: baseURLString) else {
            fatalError("Invalid \(Key.baseURL)")
        }
        return baseURL
    }()

    static let baseURLImage: URL = {
        guard let baseURLImageString = Env.infoDictionary[Key.baseURLImage] as? String else {
            fatalError(notSetInPlistErrorMessage(Key.baseURLImage))
        }
        guard let baseURLImage = URL(string: baseURLImageString) else {
            fatalError("Invalid \(Key.baseURLImage)")
        }
        return baseURLImage
    }()

    private static func notSetInPlistErrorMessage(_ key: String) -> String {
        "\(key) not set in plist"
    }
}

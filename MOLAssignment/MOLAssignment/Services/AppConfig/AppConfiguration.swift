//
//  AppConfiguration.swift
//  MOLAssignment
//
//  Created by Tajti Márk on 2022. 12. 01..
//

import Foundation

protocol AppConfigurationInput {
    var baseUrl: String { get }
    var apiKey: String { get }
}

final class AppConfiguration: AppConfigurationInput {
    enum ConfigNames {
        static let baseUrl = "API_BASE_URL"
        static let apiKey = "API_KEY"
    }
    
    let baseUrl: String
    let apiKey: String
    
    init?(bundle: Bundle) {
        guard let baseUrl = bundle.infoDictionary?[ConfigNames.baseUrl] as? String,
              let apiKey = bundle.infoDictionary?[ConfigNames.apiKey] as? String
        else {
            print("Configurations are missing")
            return nil
        }
        self.baseUrl = baseUrl
        self.apiKey = apiKey
    }
}

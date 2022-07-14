//
//  AppConfige.swift
//  Amazon
//
//  Created by Mahmoud Alaa on 14/07/2022.
//

import Foundation

final class AppConfiguration {
    
    lazy var apiBaseURL: String = {
        guard let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "ApiBaseURL") as? String else {
            fatalError("ApiBaseURL must not be empty in plist")
        }
        return apiBaseURL
    }()
    
    lazy var apiDataTransferService: DataTransferService = {
        //MARK: handle network configuration depend on schema at project like develop - production - staging etc
        let config = ApiDataNetworkConfig(baseURL: URL(string: self.apiBaseURL)!)

        let apiDataNetwork = DefaultNetworkService(config: config)
        return DefaultDataTransferService(with: apiDataNetwork)
    }()
}


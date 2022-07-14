//
//  URLSessionManager.swift
//  Network
//
//  Created by Mahmoud Alaa on 05/05/2022.
//

import Foundation

// MARK: - URLSession Network Manager
// Note: If authorization is needed NetworkSessionManager can be implemented by using,
// for example, Alamofire SessionManager with its RequestAdapter and RequestRetrier.
// And it can be incjected into NetworkService instead of default one.


public class URLSessionManager: NetworkSessionManager {
    public init() {}
    public func request(_ request: URLRequest,
                        completion: @escaping CompletionHandler) -> NetworkCancellable {
        let task = URLSession.shared.dataTask(with: request, completionHandler: completion)
        task.resume()
        return task
    }
}


extension URLSessionTask: NetworkCancellable { }


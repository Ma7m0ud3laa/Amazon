//
//  NetworkService.swift
//  Network
//
//  Created by Mahmoud Alaa on 05/05/2022.
//

import Foundation

public protocol NetworkCancellable {
    func cancel()
}

public protocol NetworkService {
    typealias CompletionHandler = (Result<Data?, NetworkError>) -> Void
    
    func request(endpoint: Requestable, completion: @escaping CompletionHandler) -> NetworkCancellable?
}

public protocol NetworkSessionManager {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    
    func request(_ request: URLRequest,
                 completion: @escaping CompletionHandler) -> NetworkCancellable
}



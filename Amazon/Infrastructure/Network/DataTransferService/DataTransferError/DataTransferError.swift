//
//  DataTransferError.swift
//  Network
//
//  Created by Mahmoud Alaa on 05/05/2022.
//

import Foundation

public enum DataTransferError: Error {
    case noResponse
    case parsing(Error)
    case networkFailure(NetworkError)
    case resolvedNetworkFailure(Error)
}

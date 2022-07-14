//
//  DataTransferErrorResolver.swift
//  Network
//
//  Created by Mahmoud Alaa on 05/05/2022.
//

import Foundation


public protocol DataTransferErrorResolver {
    func resolve(error: NetworkError) -> Error
}

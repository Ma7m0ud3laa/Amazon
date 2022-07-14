//
//  DataTransferErrorLogger.swift
//  Network
//
//  Created by Mahmoud Alaa on 05/05/2022.
//

import Foundation

public protocol DataTransferErrorLogger {
    func log(error: Error)
}

public final class DefaultDataTransferErrorLogger: DataTransferErrorLogger {
    public init() { }
    
    public func log(error: Error) {
        printIfDebug("-------------")
        printIfDebug("\(error)")
    }
}

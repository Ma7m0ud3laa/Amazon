//
//  ResponseDecoder.swift
//  Network
//
//  Created by Mahmoud Alaa on 05/05/2022.
//

import Foundation


public protocol ResponseDecoder {
    func decode<T: Decodable>(_ data: Data) throws -> T
}

public class JSONResponseDecoder: ResponseDecoder {
    private let jsonDecoder = JSONDecoder()
    public init() { }
    public func decode<T: Decodable>(_ data: Data) throws -> T {
        return try jsonDecoder.decode(T.self, from: data)
    }
}

public class RawDataResponseDecoder: ResponseDecoder {
    public init() { }
    
    enum CodingKeys: String, CodingKey {
        case `default` = ""
    }
    public func decode<T: Decodable>(_ data: Data) throws -> T {
        if T.self is Data.Type, let data = data as? T {
            return data
        } else {
            let context = DecodingError.Context(codingPath: [CodingKeys.default], debugDescription: "Expected Data type")
            throw Swift.DecodingError.typeMismatch(T.self, context)
        }
    }
}

//
//  GeneralEndpoints.swift
//  Amazon
//
//  Created by Mahmoud Alaa on 14/07/2022.
//

public enum GeneralEndpoints {
    
    case products
    
    var path: String {
        switch self {
        case .products:
            return "default/dynamodb-writer"
        }
    }
    
    //MARK: Overload this function as u need
    public func generate<E, R>(with encodableDTO: E? = nil, response: R.Type, header: [String: String] = [:]) -> Endpoint<R> where E: Encodable, R: Decodable {
        
        switch self {
        case .products:
            return Endpoint(path: self.path,
                            method: .get)
            
        }
        
    }
    
}

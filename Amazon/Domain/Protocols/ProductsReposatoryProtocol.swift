//
//  ProductsReposatoryInterface.swift
//  Amazon
//
//  Created by Mahmoud Alaa on 14/07/2022.
//

import Foundation

protocol ProductsReposatoryProtocol {
    func getProducts<T: Encodable>(requestDTO: T, _ completion: @escaping (Result<ProductsReponse, Error>) -> Void) -> Cancellable
}

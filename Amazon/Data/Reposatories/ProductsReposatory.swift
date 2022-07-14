//
//  CarsReposatory.swift
//  Amazon
//
//  Created by Mahmoud Alaa on 14/07/2022.
//


class ProductsReposatory: ProductsReposatoryProtocol {
    
    private let dataTransferService: DataTransferService
    
    init(dataTransferService: DataTransferService = AppConfiguration().apiDataTransferService) {
        self.dataTransferService = dataTransferService
    }
    
    func getProducts<T: Encodable>(requestDTO: T, _ completion: @escaping (Result<ProductsReponse, Error>) -> Void) -> Cancellable {
        
        let task = RepositoryTask()
        
        let endpoint: Endpoint<ProductsReponse> = GeneralEndpoints.products.generate(with: requestDTO, response: ProductsReponse.self)
        
        task.networkTask = dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
        return task
    }
    
}

//
//  HomeViewModel.swift
//  Amazon
//
//  Created by Mahmoud Alaa on 14/07/2022.
//

import Foundation


protocol HomeViewModelInput {
    var searchText: String { get set }
    
    func viewDidLoad()
    func refresherFired()
}

protocol HomeViewModelOutput {
    var isFetching: Bool { get }
    var products: [Product] { get }
    var alertItem: AlertItem? { get set }
}

protocol HomeViewModelProtocol: ObservableObject {
    var input: HomeViewModelInput { get set }
    var output: HomeViewModelOutput { get set }
}


final
class HomeViewModel: HomeViewModelProtocol, HomeViewModelInput, HomeViewModelOutput {
    
    
    var input: HomeViewModelInput {
        get { return self }
        set {}
    }
    
    var output: HomeViewModelOutput {
        get { return self }
        set {}
    }
    
    private
    var productsReposatory: ProductsReposatoryProtocol
    
    init(productsReposatory: ProductsReposatoryProtocol = ProductsReposatory()) {
        self.productsReposatory = productsReposatory
    }
    
    var searchText: String = ""
    
    @Published
    var isFetching: Bool = true
    
    @Published
    var products: [Product] = []
    
    @Published
    var alertItem: AlertItem?
    
    private
    var productsLoadTask: Cancellable? { willSet { self.productsLoadTask?.cancel() } }
    
    
    func viewDidLoad() {
        self.fetchProducts()
    }
    
    func refresherFired() {
        self.fetchProducts()
    }
}

extension HomeViewModel {
    
    private
    func fetchProducts() {
        
        //MARK: handle DTO Empty for now may by need to add like pagination or any require parameters in the future
        let productsDTO: ProductsDTO = .init()
        
        
        self.productsLoadTask = self.productsReposatory.getProducts(requestDTO: productsDTO, { result in
            
            self.isFetching = false
            
            switch result {
            case let .success(response):
                if let products = response.results {
                    self.products = products
                    return
                }
                self.alertItem = AlertContext.emptyData
            case let .failure(error):
                if let networkError = error as? NetworkError, case .cancelled = networkError {
                    return
                }
            
                self.alertItem = AlertContext.invalidResponse
            }
        })
        
    }
    
}

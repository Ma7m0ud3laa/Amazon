//
//  ProductDetailsViewModel.swift
//  Amazon
//
//  Created by Mahmoud Alaa on 14/07/2022.
//

import Foundation



protocol ProductDetailsViewModelInput {
    func viewDidLoad()
}

protocol ProductDetailsViewModelOutput {
    var name: String { get }
    var price: String { get }
    var imageURL: URL? { get }
}

protocol ProductDetailsViewModelProtocol: ObservableObject {
    var input: ProductDetailsViewModelInput { get }
    var output: ProductDetailsViewModelOutput { get }
}


class ProductDetailsViewModel: ProductDetailsViewModelProtocol, ProductDetailsViewModelInput, ProductDetailsViewModelOutput {
    
    var input: ProductDetailsViewModelInput {
        return self
    }
    
    var output: ProductDetailsViewModelOutput {
        return self
    }
    
    init(product: Product?) {
        self.name = product?.name ?? "Product Details"
        self.imageURL = product?.imageURL
        self.price = product?.price ?? ""
    }
    
    @Published
    var name: String
    
    @Published
    var price: String
    
    @Published
    var imageURL: URL?
    
    
    
    func viewDidLoad() {

    }
}

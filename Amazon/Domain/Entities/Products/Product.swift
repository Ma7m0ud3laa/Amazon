//
//  Product.swift
//  Amazon
//
//  Created by Mahmoud Alaa on 14/07/2022.
//

import Foundation

struct Product: Codable, Identifiable {
        
    var id: Int {
        return Int(self.uid ?? UUID().uuidString) ?? UUID().hashValue
    }
    
    let createdAt, price, name, uid: String?
    let imageIDS, imageUrlsPaths, imageUrlsThumbnails: [String]?

    var imageURL: URL? {
        return URL(string: self.imageUrlsPaths?.first ?? "")
    }
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case price, name, uid
        case imageIDS = "image_ids"
        case imageUrlsPaths = "image_urls"
        case imageUrlsThumbnails = "image_urls_thumbnails"
    }
}

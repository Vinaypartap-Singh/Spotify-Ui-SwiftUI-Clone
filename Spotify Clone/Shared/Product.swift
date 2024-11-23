//
//  Product.swift
//  Spotify Clone
//
//  Created by Vinay Sandhu on 2024-11-21.
//

import Foundation


struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price, discountPercentage, rating: Double
    let category: String
    let stock: Int
    let brand: String?
    let images: [String]
    let thumbnail: String
    
    var firstImage: String { images.first ?? Constants.randomImage }
    
    
    let recentlyAdded: Bool = {
        return Int.random(in: 1...4) == 1
    }()
    
    
    static var mock: Product {
        Product(
            id: 123,
            title: "Exmaple Product Title",
            description: "This is some mock product",
            price: 999,
            discountPercentage: 15,
            rating: 5,
            category: "Electronics",
            stock: 2,
            brand: "Apple",
            images: [
                Constants.randomImage,
                Constants.randomImage,
                Constants.randomImage
            ],
            thumbnail: Constants.randomImage
        )
    }
}


struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let title: String?
    let products: [Product]
}

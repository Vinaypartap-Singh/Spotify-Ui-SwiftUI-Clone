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
}

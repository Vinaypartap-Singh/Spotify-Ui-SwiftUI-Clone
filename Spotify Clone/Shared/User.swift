//
//  User.swift
//  Spotify Clone
//
//  Created by Vinay Sandhu on 2024-11-21.
//

import Foundation



struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

// MARK: - User
struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let email, phone, username, password: String
    let birthDate: String
    let image: String
    let bloodGroup: String
    let height, weight: Double
    let eyeColor: String
    
    
    static var mock: User {
        User(id: 111, firstName: "Vinay", lastName: "Sandhu", maidenName: "Sandhu", age: 18, email: "developervsandhu@gmail.com", phone: "+1 647-924-6141", username: "vsandhu.developer", password: "demo@demo.com", birthDate: "27/12/2005", image: Constants.randomImage, bloodGroup: "O negative", height: 180, weight: 80, eyeColor: "Brown")
    }
    
    
}

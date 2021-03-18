//
//  CarModel.swift
//  CarMart
//
//  Created by Khaled Bohout on 17/03/2021.
//

import Foundation

// MARK: - Garage
struct Garage: Codable {
    let cars: [CarModel]

    enum CodingKeys: String, CodingKey {
        case cars = "Garage"
    }
}

// MARK: - GarageElement
struct CarModel: Codable {
    let id: Int
    let brand, model, year, imageLink: String
    let createdAt, updatedAt: String
    let userID, carID: Int

    enum CodingKeys: String, CodingKey {
        case id, brand, model, year
        case imageLink = "image_link"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case userID = "user_id"
        case carID = "car_id"
    }
}

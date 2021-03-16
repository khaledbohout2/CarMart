//
//  SpeceficationsResponse.swift
//  CarMart
//
//  Created by Khaled Bohout on 16/03/2021.
//

import Foundation

// MARK: - Specification
struct Specification: Codable {
    let id: Int
    let title, imageLink, specificationCategory, createdAt: String
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, title
        case imageLink = "image_link"
        case specificationCategory = "specification_category"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

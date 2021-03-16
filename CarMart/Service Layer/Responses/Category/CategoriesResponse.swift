//
//  CategoriesResponse.swift
//  CarMart
//
//  Created by Khaled Bohout on 15/03/2021.
//

import Foundation

// MARK: - CategoriesResponse
struct CategoriesResponse: Codable {
    let currentPage: Int
    let data: [CategoryElement]
    let firstPageURL: String
    let from, lastPage: Int?
    let lastPageURL: String
    let links: [Link]
    let nextPageURL: String?
    let path: String
    let perPage: Int
    let prevPageURL: String?
    let to, total: Int

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case firstPageURL = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageURL = "last_page_url"
        case links
        case nextPageURL = "next_page_url"
        case path
        case perPage = "per_page"
        case prevPageURL = "prev_page_url"
        case to, total
    }
}

// MARK: - Datum
struct CategoryElement: Codable {
    let id: Int
    let title, photoLink, datumDescription, icon: String
    let colorCode, coloredIcon, subCategories, mapIcon: String
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, title
        case photoLink = "photo_link"
        case datumDescription = "description"
        case icon
        case colorCode = "color_code"
        case coloredIcon = "colored_icon"
        case subCategories = "sub_categories"
        case mapIcon = "map_icon"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Link
struct Link: Codable {
    let url: String?
    let active: Bool
}

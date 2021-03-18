//
//  AllWinchesResponse.swift
//  CarMart
//
//  Created by Khaled Bohout on 18/03/2021.
//

import Foundation

// MARK: - AllWinshesResponse
struct AllWinshesResponse: Codable {
    let currentPage: Int
    let data: [WinchModel]
    let firstPageURL: String
    let from, lastPage: Int
    let lastPageURL: String
    let links: [Link]
    let nextPageURL: JSONNull?
    let path: String
    let perPage: Int
    let prevPageURL: JSONNull?
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
struct WinchModel: Codable {
    let id: Int
    let fullName, accountName, phone, address: String
    let loginMethod: String?
    let accountType: String
    let verified, blocked, featured: Int
    let email, categoryTitle, photoLink: String
    let gender: String?
    let longitude, latitude, city: String
    let numberOfCompletedRequest: Int
    let forgetPasswordCode, emailVerifiedAt, phoneType, locationID: JSONNull?
    let vendorID: Int?
    let createdAt, updatedAt, specifications: String
    let rate: Int

    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case accountName = "account_name"
        case phone, address
        case loginMethod = "login_method"
        case accountType = "account_type"
        case verified, blocked, featured, email
        case categoryTitle = "category_title"
        case photoLink = "photo_link"
        case gender, longitude, latitude, city
        case numberOfCompletedRequest = "number_of_completed_request"
        case forgetPasswordCode = "forget_password_code"
        case emailVerifiedAt = "email_verified_at"
        case phoneType = "phone_type"
        case locationID = "location_id"
        case vendorID = "vendor_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case specifications, rate
    }
}

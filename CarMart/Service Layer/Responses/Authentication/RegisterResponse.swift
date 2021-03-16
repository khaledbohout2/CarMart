//
//  RegisterResponse.swift
//  CarMart
//
//  Created by Khaled Bohout on 16/03/2021.
//

import Foundation

// MARK: - CategoriesResponse
struct RegisterResponse: Codable {
    
    let fullName, accountName, phone, accountType: String?
    let email, updatedAt, createdAt: String?
    let id: Int?
    let tokens: Tokens?
    var error: String?

    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case accountName = "account_name"
        case phone
        case accountType = "account_type"
        case email
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case id, tokens, error
    }
}

// MARK: - Tokens
struct Tokens: Codable {
    let tokenType: String
    let expiresIn: Int
    let accessToken, refreshToken: String

    enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
}

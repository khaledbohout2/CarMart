//
//  LoginResponse.swift
//  CarMart
//
//  Created by Khaled Bohout on 14/03/2021.
//

import Foundation

// MARK: - LoginResponse
struct LoginResponse: Codable {
    let token: String?
    let id: Int?
    let userName, profileImage, error: String?

    enum CodingKeys: String, CodingKey {
        case token, id
        case userName = "user_name"
        case profileImage = "profile_image"
        case error
    }
}

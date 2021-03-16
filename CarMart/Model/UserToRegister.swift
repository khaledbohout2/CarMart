//
//  UserToRegister.swift
//  CarMart
//
//  Created by Khaled Bohout on 15/03/2021.
//

import Foundation

struct UserToRegister: Codable {
    
    var fullName, accountName, phone, accountType: String?
    var email, password, passwordConfirmation, carID: String?

    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case accountName = "account_name"
        case phone
        case accountType = "account_type"
        case email, password
        case passwordConfirmation = "password_confirmation"
        case carID = "car_id"
    }
}

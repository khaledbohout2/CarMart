//
//  ModelsResponse.swift
//  CarMart
//
//  Created by Khaled Bohout on 15/03/2021.
//

import Foundation

// MARK: - ModelsResponse
struct ModelsResponse: Codable {
    let models: [Model]
}

// MARK: - Model
struct Model: Codable {
    let model: String
}

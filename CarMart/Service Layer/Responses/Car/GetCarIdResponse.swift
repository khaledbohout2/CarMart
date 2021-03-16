//
//  GetCarIdRequest.swift
//  CarMart
//
//  Created by Khaled Bohout on 15/03/2021.
//

import Foundation

// MARK: - CarIDResponse
struct CarIDResponse: Codable {
    let carID: Int

    enum CodingKeys: String, CodingKey {
        case carID = "car_id"
    }
}

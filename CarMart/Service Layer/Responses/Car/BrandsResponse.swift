//
//  BrandsResponse.swift
//  CarMart
//
//  Created by Khaled Bohout on 15/03/2021.
//

import Foundation

// MARK: - BrandsResponse
struct BrandsResponse: Codable {
    let brands: [Brand]
}

// MARK: - Brand
struct Brand: Codable {
    let brand: String
}

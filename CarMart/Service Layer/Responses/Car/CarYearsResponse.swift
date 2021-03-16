//
//  CarYearsResponse.swift
//  CarMart
//
//  Created by Khaled Bohout on 15/03/2021.
//

import Foundation

// MARK: - YearssResponse
struct CarYearssResponse: Codable {
    let years: [Year]
}

// MARK: - Year
struct Year: Codable {
    let year: String
}

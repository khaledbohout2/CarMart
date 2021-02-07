//
//  Offers.swift
//  GPless
//
//  Created by Khaled Bohout on 11/19/20.
//

import Foundation

/// offers API response model

struct Offers: Codable {
    
    var offers: [OfferModel]?
    var noOfPages, count: Int?
    var vendor: Vendor?

    enum CodingKeys: String, CodingKey {
        case offers
        case noOfPages = "no_of_pages"
        case count
        case vendor
    }
}

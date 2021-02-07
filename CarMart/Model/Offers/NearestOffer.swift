//
//  Offer.swift
//  GPless
//
//  Created by Khaled Bohout on 11/2/20.
//


import Foundation

/// nearest offers API response Model

// MARK: - Offer

struct NearestOffersResponse: Codable {
    
    var responseOffers: [NearestOffer]?

    enum CodingKeys: String, CodingKey {
        case responseOffers = "response_offers"
    }
}

// nearest offers vendor with its offers and location


struct NearestOffer: Codable {
    
    var vendor: Vendor?
    var location: Location?
    var offers: [OfferModel]?
}

// MARK: - Location
struct Location: Codable {
    var longitude, latitude: String?
}

// vendor model

// MARK: - Vendor
struct Vendor: Codable {
    
    var fullName: String?
    var colorCode: String?
    var coloredIcon: String?

    enum CodingKeys: String, CodingKey {
        
        case fullName = "full_name"
        case colorCode = "color_code"
        case coloredIcon = "colored_icon"
    }
}

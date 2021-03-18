//
//  HomeOffers.swift
//  GPless
//
//  Created by Khaled Bohout on 11/23/20.
//

import Foundation

// MARK: - HomeOffers

/// home data API model

struct HomeOffers: Codable {
    
    var populerOffers, freeOffers, paidOffers: [OfferModel]?
    var featured: [String]?
    var photos: [String]?

    enum CodingKeys: String, CodingKey {
        case populerOffers = "populer_offers"
        case freeOffers = "free_offers"
        case paidOffers = "paid_offers"
        case featured, photos
    }
}

//
//  FilterResponse.swift
//  GPless
//
//  Created by Khaled Bohout on 24/12/2020.
//

import Foundation

/// filter API response model

struct FilterResponse: Codable {
    var offers: [OfferModel]?
}

//
//  PostMessageResponse.swift
//  GPless
//
//  Created by Khaled Bohout on 12/8/20.
//


import Foundation

/// post message api response

// MARK: - PostMessageResponse
struct PostMessageResponse: Codable {
    var state, error: String?
}

//
//  PostMessageModel.swift
//  GPless
//
//  Created by Khaled Bohout on 12/8/20.
//

import Foundation

/// post message api parameters model

// MARK: - PostMessage
struct PostMessage: Codable {
    var name, email, phone, title: String?
    var postMessageDescription: String?

    enum CodingKeys: String, CodingKey {
        case name, email, phone, title
        case postMessageDescription = "description"
    }
}

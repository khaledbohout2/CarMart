//
//  NotificationsResponse.swift
//  CarMart
//
//  Created by Khaled Bohout on 17/03/2021.
//

import Foundation

// MARK: - NotificationsResponse
struct NotificationsResponse: Codable {
    let currentPage: Int
    let notifications: [NotificationModel]
    let firstPageURL: String
    let from, to: Int?
    let lastPage: Int
    let lastPageURL: String
    let links: [Link]
    let nextPageURL: String?
    let path: String
    let perPage: Int
    let prevPageURL : String?
    let total: Int

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case notifications = "data"
        case firstPageURL = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageURL = "last_page_url"
        case links
        case nextPageURL = "next_page_url"
        case path
        case perPage = "per_page"
        case prevPageURL = "prev_page_url"
        case to, total
    }
}

struct NotificationModel: Codable {
    
    var id: Int?
    var title, type: String?
    var userID, seen: Int?
    var notificationDescription: String?
    var imageLink: String?
    var targetAudience, createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        
        case id, title, type
        case userID = "user_id"
        case seen
        case notificationDescription = "description"
        case imageLink = "image_link"
        case targetAudience = "target_audience"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

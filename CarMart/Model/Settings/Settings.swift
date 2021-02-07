
//
//  Settings.swift
//  GPless
//
//  Created by Khaled Bohout on 12/3/20.
//

import Foundation

// MARK: - Settings
struct Settings: Codable {
    var faqs: [FAQ]?
    var setting: Setting?
}

// MARK: - FAQ
struct FAQ: Codable {
    var key: String?
    var value: [String]?
}

// MARK: - Setting
struct Setting: Codable {
    var id: Int?
    var createdAt, updatedAt: String?
    var iconsLink, mapIconsLinks, coloredIconsLink: String?
    var baseURL: String?
    var bannersLink, notificationsLink: String?
    var sixMonthsMembershipFees, oneYearMembershipFees, topRatedStartDate, topRatedEndDate: String?
    var whatIsTodayLink, usersPhotoLink, categoriesLink, offersLink: String?
    var hotline, mobile: String?
    var termsAndCondition, privacyPolicy: String?
    var faqs: [FAQ]?

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case iconsLink = "icons_link"
        case mapIconsLinks = "map_icons_links"
        case coloredIconsLink = "colored_icons_link"
        case baseURL = "base_url"
        case bannersLink = "banners_link"
        case notificationsLink = "notifications_link"
        case sixMonthsMembershipFees = "six_months_membership_fees"
        case oneYearMembershipFees = "one_year_membership_fees"
        case topRatedStartDate = "top_rated_start_date"
        case topRatedEndDate = "top_rated_end_date"
        case whatIsTodayLink = "what_is_today_link"
        case usersPhotoLink = "users_photo_link"
        case categoriesLink = "categories_link"
        case offersLink = "offers_link"
        case hotline, mobile
        case termsAndCondition = "terms_and_condition"
        case privacyPolicy = "privacy_policy"
        case faqs
    }
}

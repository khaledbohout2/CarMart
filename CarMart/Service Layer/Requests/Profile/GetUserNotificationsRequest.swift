//
//  GetUserNotificationsRequest.swift
//  CarMart
//
//  Created by Khaled Bohout on 17/03/2021.
//

import Foundation

final class GetUserNotificationsRequest: Requestable {
    
    typealias ResponseType = NotificationsResponse
    private var carID: String?
    
    init() {
        
    }
    
    var baseUrl: URL {
        return  URL(string: URLS.baseURL)!
    }
    
    var endpoint: String {
        
        return "api/notifications"
    }
    
    var method: Network.Method {
        return .post
    }
    
    var query: Network.QueryType {
        return .path
    }
    
    var parameters: [String : Any]? {
        
        return nil
    }
    
    var headers: [String : String]? {

        var header = ["Authorization": "Bearer " + getaccessToken(), "Accept" : "application/json"]
        
        for item in defaultJSONHeader {
            header.updateValue(item.value, forKey: item.key)
        }
        return header
    }
    
    var timeout: TimeInterval {
        return 30.0
    }
    
    var cachePolicy: NSURLRequest.CachePolicy {
        return .reloadIgnoringLocalAndRemoteCacheData
    }
}

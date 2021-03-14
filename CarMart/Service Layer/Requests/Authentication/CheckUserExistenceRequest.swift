//
//  CheckUserExistenceRequest.swift
//  CarMart
//
//  Created by Khaled Bohout on 11/03/2021.
//

import Foundation

final class CheckUserExistenceRequest: Requestable {
    
    typealias ResponseType = Int
    
    private var mail: String!
    
    init(mail: String) {
        
        self.mail = mail
    }
    
    var baseUrl: URL {
        return  URL(string: URLS.baseURL)!
    }
    
    var endpoint: String {
        
        return "api/check_user_existance/\(mail!)"
    }
    
    var method: Network.Method {
        return .get
    }
    
    var query: Network.QueryType {
        return .path
    }
    
    var parameters: [String : Any]? {
        
        return nil
    }
    
    var headers: [String : String]? {

        return defaultJSONHeader
    }
    
    var timeout: TimeInterval {
        return 30.0
    }
    
    var cachePolicy: NSURLRequest.CachePolicy {
        return .reloadIgnoringLocalAndRemoteCacheData
    }
}

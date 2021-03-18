//
//  ResetPasswordRequest.swift
//  CarMart
//
//  Created by Khaled Bohout on 17/03/2021.
//

import Foundation

class CreateResetPasswordCodeRequest: Requestable {
    
    typealias ResponseType = Int
    
    private var mail: String?
    
    init(mail: String) {
        
        self.mail = mail
    }
    
    var baseUrl: URL {
        return  URL(string: URLS.baseURL)!
    }
    
    var endpoint: String {
        
        return "api/CreateResetPasswordCode"
    }
    
    var method: Network.Method {
        return .post
    }
    
    var query: Network.QueryType {
        return .path
    }
    
    var parameters: [String : Any]? {
        
        return ["email": self.mail!]
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

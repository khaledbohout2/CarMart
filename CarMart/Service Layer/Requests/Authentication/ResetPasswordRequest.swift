//
//  ResetPasswordRequest.swift
//  CarMart
//
//  Created by Khaled Bohout on 18/03/2021.
//

import Foundation

class ResetPasswordRequest: Requestable {
    
    typealias ResponseType = Int
    
    private var code: String?
    private var password: String?
    
    init(code: String, password: String) {
        
        self.code = code
        self.password = password
    }
    
    var baseUrl: URL {
        return  URL(string: URLS.baseURL)!
    }
    
    var endpoint: String {
        
        return "api/ResetPassword"
    }
    
    var method: Network.Method {
        return .post
    }
    
    var query: Network.QueryType {
        return .path
    }
    
    var parameters: [String : Any]? {
        
        return ["code": self.code!, "password": self.password!, "password_confirmation": self.password!]
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

//
//  loginUserRequest.swift
//  CarMart
//
//  Created by Khaled Bohout on 11/03/2021.
//

import Foundation

final class loginUserRequest: Requestable {
    
    typealias ResponseType = LoginResponse
    
    private var mail: String?
    private var pass: String?
    
    init(mail: String, pass: String) {
        
        self.mail = mail
        self.pass = pass
    }
    
    var baseUrl: URL {
        return  URL(string: URLS.baseURL)!
    }
    
    var endpoint: String {
        
        return "api/login?email=\(mail!)&password=\(pass!)"
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

        return defaultJSONHeader
    }
    
    var timeout: TimeInterval {
        return 30.0
    }
    
    var cachePolicy: NSURLRequest.CachePolicy {
        return .reloadIgnoringLocalAndRemoteCacheData
    }
}

//
//  RegisterUserRequest.swift
//  CarMart
//
//  Created by Khaled Bohout on 14/03/2021.
//

import Foundation

class RegisterUserRequest: Requestable {
    
    typealias ResponseType = RegisterResponse
    
    private var userToRegister: UserToRegister?

    
    init(userToRegister: UserToRegister) {
        
        self.userToRegister = userToRegister
    }
    
    var baseUrl: URL {
        return  URL(string: URLS.baseURL)!
    }
    
    var endpoint: String {
        
        return "api/register"
    }
    
    var method: Network.Method {
        return .post
    }
    
    var query: Network.QueryType {
        return .path
    }
    
    var parameters: [String : Any]? {
        
        let par = try! userToRegister!.asDictionary()
        
        return par
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

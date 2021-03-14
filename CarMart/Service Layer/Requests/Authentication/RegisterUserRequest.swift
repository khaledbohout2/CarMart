//
//  RegisterUserRequest.swift
//  CarMart
//
//  Created by Khaled Bohout on 14/03/2021.
//

import Foundation

class RegisterUserRequest: Requestable {
    
    typealias ResponseType = LoginResponse
    
    private var name: String?
    private var mail: String?
    private var pass: String?
    private var phone: String?
    
    init(mail: String, pass: String, phone: String) {
        
        self.mail = mail
        self.pass = pass
        self.phone = phone
    }
    
    var baseUrl: URL {
        return  URL(string: URLS.baseURL)!
    }
    
    var endpoint: String {
        
        return "api/register?full_name=\()&account_name=omarahmed123&phone=01013917488&address=2 abbasia street&account_type=Normal&email=omar@gmail.com&category_title=Mechanic&gender=male&longitude=12.222&latitude=15.555&city=cairo&specifications[]=عفشة&password=12345678&password_confirmation=12345678&specifications[]=بطاريات"
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

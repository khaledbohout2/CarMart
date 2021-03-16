//
//  GetAllSpeceficationsRequest.swift
//  CarMart
//
//  Created by Khaled Bohout on 16/03/2021.
//

import Foundation

final class GetAllSpeceficationsRequest: Requestable {
    
    typealias ResponseType = [Specification]
    
    init() {
    }
    
    var baseUrl: URL {
        return  URL(string: URLS.baseURL)!
    }
    
    var endpoint: String {
        
        return "api/specifications"
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


//
//  SearchCategoriesRequest.swift
//  CarMart
//
//  Created by Khaled Bohout on 16/03/2021.
//

import Foundation

final class SearchCategoriesRequest: Requestable {
    
    typealias ResponseType = CategoriesResponse
    private var value: String?
    
    init(value: String) {
        
        self.value = value
    }
    
    var baseUrl: URL {
        return  URL(string: URLS.baseURL)!
    }
    
    var endpoint: String {
        
        return "api/categories_search"
    }
    
    var method: Network.Method {
        return .post
    }
    
    var query: Network.QueryType {
        return .path
    }
    
    var parameters: [String : Any]? {
        
        return ["value" : self.value!]
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

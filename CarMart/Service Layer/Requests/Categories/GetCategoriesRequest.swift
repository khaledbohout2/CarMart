//
//  GetCategoriesRequest.swift
//  CarMart
//
//  Created by Khaled Bohout on 15/03/2021.
//

import Foundation

final class GetCategoriesRequest: Requestable {
    
    typealias ResponseType = CategoriesResponse
    private var page: Int?
    
    init(page: Int) {
        
        self.page = page
    }
    
    var baseUrl: URL {
        return  URL(string: URLS.baseURL)!
    }
    
    var endpoint: String {
        
        return "api/categories?page=\(self.page!)"
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

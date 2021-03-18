//
//  GetCarYearsRequest.swift
//  CarMart
//
//  Created by Khaled Bohout on 15/03/2021.
//

import Foundation

final class GetCarYearsRequest: Requestable {
    
    typealias ResponseType = CarData
    
    private var brand: String
    private var model: String
    
    init(brand: String, model: String) {
        
        self.brand = brand
        self.model = model
    }
    
    var baseUrl: URL {
        
        return  URL(string: URLS.baseURL)!
    }
    
    var endpoint: String {
        
        return "api/GetCarYears/\(brand)/\(model)"
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

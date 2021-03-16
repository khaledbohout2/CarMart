//
//  GetCarIdRequest.swift
//  CarMart
//
//  Created by Khaled Bohout on 15/03/2021.
//

import Foundation

final class GetCarIdRequest: Requestable {
    
    typealias ResponseType = CarIDResponse
    
    private var brand: String
    private var model: String
    private var year: String
    
    init(brand: String, model: String, year: String) {
        
        self.brand = brand
        self.model = model
        self.year = year
    }
    
    var baseUrl: URL {
        
        return  URL(string: URLS.baseURL)!
    }
    
    var endpoint: String {
        
        return "api/GetCarId/\(brand)/\(model)/\(year)"
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

//
//  AddUserCarRequest.swift
//  CarMart
//
//  Created by Khaled Bohout on 17/03/2021.
//

import Foundation

final class AddUserCarRequest: Requestable {
    
    typealias ResponseType = Int
    private var carID: String?
    
    init(carID: String) {
        self.carID = carID
    }
    
    var baseUrl: URL {
        return  URL(string: URLS.baseURL)!
    }
    
    var endpoint: String {
        
        return "api/AttachToGarage"
    }
    
    var method: Network.Method {
        return .post
    }
    
    var query: Network.QueryType {
        return .path
    }
    
    var parameters: [String : Any]? {
        
        return ["car_id" : self.carID!]
    }
    
    var headers: [String : String]? {

        var header = ["Authorization": "Bearer " + getaccessToken(), "Accept" : "application/json"]
        
        for item in defaultJSONHeader {
            header.updateValue(item.value, forKey: item.key)
        }
        return header
    }
    
    var timeout: TimeInterval {
        return 30.0
    }
    
    var cachePolicy: NSURLRequest.CachePolicy {
        return .reloadIgnoringLocalAndRemoteCacheData
    }
}

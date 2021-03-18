//
//  HomePresenter.swift
//  CarMart
//
//  Created by Khaled Bohout on 16/03/2021.
//

import Foundation

protocol HomeDelegate: class {
    
    func getAllSpecificationsSuccess(success: Bool)
    func passAllSpecifications(specs: [Specification])
}

class HomePresenter {
    
    weak var delegate: HomeDelegate?
    
    func getAllSpecifications(req: GetAllSpeceficationsRequest) {
        
        Network.request(req: req) { (result) in
            switch result {
            case .success(let specifications):
                print(specifications)
                self.delegate?.getAllSpecificationsSuccess(success: true)
                self.delegate?.passAllSpecifications(specs: specifications)
            case .cancel(let cancelError):
                print(cancelError!)
                self.delegate?.getAllSpecificationsSuccess(success: false)
            case .failure(let error):
                print(error!)
                self.delegate?.getAllSpecificationsSuccess(success: false)
            }
        }
    }
}

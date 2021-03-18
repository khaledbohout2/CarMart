//
//  CategoriesPresenter.swift
//  CarMart
//
//  Created by Khaled Bohout on 15/03/2021.
//

import Foundation

protocol CategoriesDelegate: class {
    
    func getCategoriesSuccess(success: Bool)
    func passCategories(categories: CategoriesResponse)
    
    func searchCategoriesSuccess(success: Bool)
    func passSearchCategories(categories: CategoriesResponse)
}

class CategoriesPresenter {
    
    weak var delegate: CategoriesDelegate?
    
    func getCategories(req: GetCategoriesRequest) {
        Network.request(req: req) { (result) in
            switch result {
            case .success(let categories):
                print(categories)
                self.delegate?.getCategoriesSuccess(success: true)
                self.delegate?.passCategories(categories: categories)
            case .cancel(let cancelError):
                print(cancelError!)
                self.delegate?.getCategoriesSuccess(success: false)
            case .failure(let error):
                print(error!)
                self.delegate?.getCategoriesSuccess(success: false)
            }
        }
    }
    
    func searchCategories(req: SearchCategoriesRequest) {
        
        Network.request(req: req) { (result) in
            switch result {
            case .success(let categories):
                print(categories)
                self.delegate?.searchCategoriesSuccess(success: true)
                self.delegate?.passSearchCategories(categories: categories)
            case .cancel(let cancelError):
                print(cancelError!)
                self.delegate?.searchCategoriesSuccess(success: false)
            case .failure(let error):
                print(error!)
                self.delegate?.searchCategoriesSuccess(success: false)
            }
        }
    }
}

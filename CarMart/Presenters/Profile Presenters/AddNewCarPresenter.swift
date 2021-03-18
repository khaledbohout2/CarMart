//
//  AddNewCarPresenter.swift
//  CarMart
//
//  Created by Khaled Bohout on 17/03/2021.
//

import Foundation

protocol AddNewCarDelegate: class {
    
    func getCarBrandsSuccess(success: Bool)
    func passCarBrands(brands: [String])
    
    func getCarModelsSuccess(success: Bool)
    func passCarModels(models: [String])
    
    func getCarYearsSuccess(success: Bool)
    func passCarYears(years: [String])
    
    func getCarIdsuccess(success: Bool)
    func passCarId(carId: Int)
    
    func addCarSuccess(success: Bool)
    
}

class AddNewCarPresenter {
    
    weak var delegate: AddNewCarDelegate?
    
    func getCarBrands(req: GetCarsBrandsRequest) {
        
        Network.request(req: req) { (result) in
            switch result {
            
            case .success(let response):
                print(response)
                self.delegate?.getCarBrandsSuccess(success: true)
                self.delegate?.passCarBrands(brands: response.items)
            case .cancel(let cancelError):
                print(cancelError!)
                self.delegate?.getCarBrandsSuccess(success: false)
            case .failure(let error):
                print(error!)
                self.delegate?.getCarBrandsSuccess(success: false)
            }
        }
    }
    
    func getCarModels(req: GetCarBrandModelsRequest) {
        Network.request(req: req) { (result) in
            switch result {
            
            case .success(let response):
                print(response)
                self.delegate?.getCarModelsSuccess(success: true)
                self.delegate?.passCarModels(models: response.items)
            case .cancel(let cancelError):
                print(cancelError!)
                self.delegate?.getCarModelsSuccess(success: false)
            case .failure(let error):
                print(error!)
                self.delegate?.getCarModelsSuccess(success: false)
            }
        }
    }
    
    func getCarYears(req: GetCarYearsRequest) {
        Network.request(req: req) { (result) in
            switch result {
            
            case .success(let response):
                print(response)
                self.delegate?.getCarYearsSuccess(success: true)
                self.delegate?.passCarYears(years: response.items)
            case .cancel(let cancelError):
                print(cancelError!)
                self.delegate?.getCarYearsSuccess(success: false)
            case .failure(let error):
                print(error!)
                self.delegate?.getCarYearsSuccess(success: false)
            }
        }
    }
    
    func getCarId(req: GetCarIdRequest) {
        
        Network.request(req: req) { (result) in
            switch result {
            
            case .success(let response):
                print(response)
                self.delegate?.getCarIdsuccess(success: true)
                self.delegate?.passCarId(carId: response.carID)
            case .cancel(let cancelError):
                print(cancelError!)
                self.delegate?.getCarIdsuccess(success: false)
            case .failure(let error):
                print(error!)
                self.delegate?.getCarIdsuccess(success: false)
            }
        }
    }
    
    func addNewCar(req: AddUserCarRequest) {
        
        Network.request(req: req) { (result) in
            switch result {
            case .success(let car):
                print(car)
                self.delegate?.addCarSuccess(success: true)
            case .cancel(let cancelError):
                print(cancelError!)
                self.delegate?.addCarSuccess(success: false)
            case .failure(let error):
                print(error!)
                self.delegate?.addCarSuccess(success: false)
            }
        }
    }
    
}

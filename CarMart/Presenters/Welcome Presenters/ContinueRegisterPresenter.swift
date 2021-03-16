//
//  RegiterPresenter.swift
//  CarMart
//
//  Created by Khaled Bohout on 14/03/2021.
//

import Foundation

protocol ContinueRegisterDelegate: class {

    func registerUserSuccess(success: Bool)
    func registerUser(user: RegisterResponse)
    
    func getCarBrandsSuccess(success: Bool)
    func passCarBrands(brands: [Brand])
    
    func getCarModelsSuccess(success: Bool)
    func passCarModels(models: [Model])
    
    func getCarYearsSuccess(success: Bool)
    func passCarYears(years: [Year])
    
    func getCarIdsuccess(success: Bool)
    func passCarId(carId: Int)
}

class ContinueRegisterPresenter {
    
    weak var delegate: ContinueRegisterDelegate?
    
    func registerUser(req: RegisterUserRequest) {
        
        Network.request(req: req) { (result) in
            switch result {
            
            case .success(let user):
                print(user)
                self.delegate?.registerUserSuccess(success: true)
                self.delegate?.registerUser(user: user)
            case .cancel(let cancelError):
                print(cancelError!)
                self.delegate?.registerUserSuccess(success: false)
            case .failure(let error):
                print(error!)
                self.delegate?.registerUserSuccess(success: false)
            }
        }
    }
    
    func getCarBrands(req: GetCarsBrandsRequest) {
        
        Network.request(req: req) { (result) in
            switch result {
            
            case .success(let response):
                print(response)
                self.delegate?.getCarBrandsSuccess(success: true)
                self.delegate?.passCarBrands(brands: response.brands)
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
                self.delegate?.passCarModels(models: response.models)
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
                self.delegate?.passCarYears(years: response.years)
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

}



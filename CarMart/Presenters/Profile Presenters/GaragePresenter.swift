//
//  GaragePresenter.swift
//  CarMart
//
//  Created by Khaled Bohout on 17/03/2021.
//

import Foundation

protocol GarageDelegate: class {
    func getCarsSuccess(success: Bool)
    func passCars(cars: [CarModel])
}

class GaragePresenter {
    
    weak var delegate: GarageDelegate?
    
    func getUserCars(req: GetUserGarageRequest) {
        
        Network.request(req: req) { (result) in
            switch result {
            case .success(let garage):
                print(garage)
                self.delegate?.getCarsSuccess(success: true)
                self.delegate?.passCars(cars: garage.cars)
            case .cancel(let cancelError):
                print(cancelError!)
                self.delegate?.getCarsSuccess(success: false)
            case .failure(let error):
                print(error!)
                self.delegate?.getCarsSuccess(success: false)
            }
        }
    }
}

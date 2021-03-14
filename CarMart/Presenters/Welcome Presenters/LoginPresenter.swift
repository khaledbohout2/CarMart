//
//  LoginPresenter.swift
//  CarMart
//
//  Created by Khaled Bohout on 14/03/2021.
//

import Foundation

protocol LoginDelegate: class {
    
    func CheckUserExistence(success: Bool)
    func userExists(exists: Bool)
    func loginUserSuccess(success: Bool)
    func loginUser(response: LoginResponse)
}

class LoginPresenter {
    
    weak var delegate: LoginDelegate?
    
    func checkMobileExistence(req: CheckUserExistenceRequest) {
        
        Network.request(req: req) { (result) in
            switch result {
            
            case .success(let existes):
                
                print(existes)
                
                self.delegate?.CheckUserExistence(success: true)
                
                if existes == 1 {
                    
                    self.delegate?.userExists(exists: true)
                    
                } else {
                    
                    self.delegate?.userExists(exists: false)
                }
                
            case .cancel(let cancelError):
                
                print(cancelError!)
                self.delegate?.CheckUserExistence(success: false)
                
            case .failure(let error):
                
                print(error!)
                self.delegate?.CheckUserExistence(success: false)
            }
        }
    }
    
    func loginUser(req: loginUserRequest) {
        
        Network.request(req: req) { (result) in
            switch result {
            case .success(let response):
                print(response)
                self.delegate?.loginUserSuccess(success: true)
                self.delegate?.loginUser(response: response)
                saveLoginUser(user: response)
            case .cancel(let cancelError):
                print(cancelError!)
                self.delegate?.loginUserSuccess(success: false)
            case .failure(let error):
                print(error!)
                self.delegate?.loginUserSuccess(success: false)
            }
        }
    }
}

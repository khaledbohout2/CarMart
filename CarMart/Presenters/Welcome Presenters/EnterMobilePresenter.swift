//
//  EnterMobilePresenter.swift
//  CarMart
//
//  Created by Khaled Bohout on 18/03/2021.
//

import Foundation

protocol EnterMobileDelegate {
    func creatCodeSuccess(success: Bool)
}

class EnterMobilePresenter {
    
    var delegate: EnterMobileDelegate?
    
    func createResetPassword(req: CreateResetPasswordCodeRequest) {
        
        Network.request(req: req) { (result) in
            switch result {
            case .success(let success):
                print(success)
                if success == 1 {
                    self.delegate?.creatCodeSuccess(success: true)
                } else {
                    self.delegate?.creatCodeSuccess(success: false)
                }
            case .cancel(let cancelError):
                print(cancelError!)
                self.delegate?.creatCodeSuccess(success: false)
            case .failure(let error):
                print(error!)
                self.delegate?.creatCodeSuccess(success: false)
            }
        }
    }
}

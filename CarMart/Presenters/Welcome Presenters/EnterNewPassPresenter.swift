//
//  EnterVerificationCodePresenter.swift
//  CarMart
//
//  Created by Khaled Bohout on 18/03/2021.
//

import Foundation

protocol EnterNewPassDelegate {
    
    func verificationCodeSuccess(success: Bool)
}

class EnterNewPassPresenter {
    
    var delegate : EnterNewPassDelegate?
    
    func ResetPassword(req: ResetPasswordRequest) {
        
        Network.request(req: req) { (result) in
            switch result {
            case .success(let success):
                print(success)
                if success == 1 {
                    self.delegate?.verificationCodeSuccess(success: true)
                } else {
                    self.delegate?.verificationCodeSuccess(success: false)
                }
            case .cancel(let cancelError):
                print(cancelError!)
                self.delegate?.verificationCodeSuccess(success: false)
            case .failure(let error):
                print(error!)
                self.delegate?.verificationCodeSuccess(success: false)
            }
        }
        
    }
}

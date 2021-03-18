//
//  EditProfilePresenters.swift
//  CarMart
//
//  Created by Khaled Bohout on 18/03/2021.
//

import Foundation

protocol EditProfileDelegate {
    func editProfileSuccess(success: Bool)
}

class EditProfilePresenters {
    
    var delegate: EditProfileDelegate?
    
    func editProfile(req: EditProfileRequest) {
        
        Network.request(req: req) { (result) in
            switch result {
            case .success(let success):
                print(success)
                if success == 1 {
                    self.delegate?.editProfileSuccess(success: true)
                } else {
                    self.delegate?.editProfileSuccess(success: false)
                }
            case .cancel(let cancelError):
                print(cancelError!)
                self.delegate?.editProfileSuccess(success: false)
            case .failure(let error):
                print(error!)
                self.delegate?.editProfileSuccess(success: false)
            }
        }
    }
}

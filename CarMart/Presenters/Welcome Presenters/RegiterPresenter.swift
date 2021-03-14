//
//  RegiterPresenter.swift
//  CarMart
//
//  Created by Khaled Bohout on 14/03/2021.
//

import Foundation

protocol RegisterDelegate: class {

    func registerUserSuccess(success: Bool)
    func registerUser(response: LoginResponse)
}

class RegisterPresenter {
    
    weak var delegate: RegisterDelegate?
    
}

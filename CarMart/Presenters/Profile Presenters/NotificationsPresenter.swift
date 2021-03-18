//
//  NotificationsPresenter.swift
//  CarMart
//
//  Created by Khaled Bohout on 17/03/2021.
//

import Foundation

protocol NotificationsDelegate: class {
    func getnotificationsSuccess(success: Bool)
    func passUserNotificatios(notification: NotificationsResponse)
}

class NotificationsPresenter {
    
    weak var delegate: NotificationsDelegate?
    
    func getNotifications(req: GetUserNotificationsRequest) {
        
        Network.request(req: req) { (result) in
            switch result {
            case .success(let response):
                print(response)
                self.delegate?.getnotificationsSuccess(success: true)
                self.delegate?.passUserNotificatios(notification: response)
            case .cancel(let cancelError):
                print(cancelError!)
                self.delegate?.getnotificationsSuccess(success: false)
            case .failure(let error):
                print(error!)
                self.delegate?.getnotificationsSuccess(success: false)
            }
        }
    }
}

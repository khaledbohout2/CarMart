//
//  EditProfileVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 09/02/2021.
//

import UIKit
import SkyFloatingLabelTextField
import JGProgressHUD

class EditProfileVC: UIViewController {

    @IBOutlet weak var nameTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var phoneTextField: SkyFloatingLabelTextField!
    
    var hud = JGProgressHUD(style: .extraLight)
    
    var editProfilePresenter = EditProfilePresenters()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        editProfilePresenter.delegate = self
    }
    

    @IBAction func saveBtnTapped(_ sender: Any) {
        
     //   self.editProfilePresenter.editProfile(req: <#T##EditProfileRequest#>)
    }
    
    func updateUI() {
        
    }
    
}

extension EditProfileVC: EditProfileDelegate {
    
    func editProfileSuccess(success: Bool) {
        
        if success {
            
            hud.dismiss()
            
        } else {
            
            hud.dismiss()
            Toast.show(message: "some error happened, please try again", controller: self)
        }
    }
    
    
    
}

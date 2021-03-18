//
//  EnterNewPassVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 18/03/2021.
//

import Foundation
import JGProgressHUD

class EnterNewPassVC: UIViewController {
    
    @IBOutlet weak var newPasswordTxtField: UITextField!
    
    @IBOutlet weak var confirmNewPasswordTxField: UITextField!
    
    var verificationCode: String?
    
    var enterNewPassPresenter = EnterNewPassPresenter()
    
    var hud = JGProgressHUD(style: .extraLight)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterNewPassPresenter.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneBtnTapped(_ sender: Any) {
        
        guard newPasswordTxtField.text != "" else {
            Toast.show(message: "please enter new password", controller: self)
            return
        }
        guard confirmNewPasswordTxField.text != ""  else {
            Toast.show(message: "please confirm your passwors", controller: self)
            return
        }
        guard newPasswordTxtField.text != confirmNewPasswordTxField.text else {
            Toast.show(message: "password do not match", controller: self)
            return
        }
        let req = ResetPasswordRequest(code: self.verificationCode!, password: self.newPasswordTxtField.text!)
        
        if Reachable.isConnectedToNetwork() {
            
            hud.textLabel.text = "loading"
            hud.show(in: self.view)
            
            self.enterNewPassPresenter.ResetPassword(req: req)
            
        } else {
            
            Toast.show(message: "no internet", controller: self)
        }
        
        
    }
}

extension EnterNewPassVC: EnterNewPassDelegate {
    
    func verificationCodeSuccess(success: Bool) {
        
        if success {
            hud.dismiss()
            let storyBoard = UIStoryboard(name: "main", bundle: nil)
            let loginVC = storyBoard.instantiateViewController(withIdentifier: "LoginVC")
            self.navigationController?.popToViewController(loginVC, animated: true)
        }
    }
    
    
}

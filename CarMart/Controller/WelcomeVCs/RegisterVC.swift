//
//  RegisterVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 14/03/2021.
//

import UIKit
import JGProgressHUD

class RegisterVC: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func enterBtnTapped(_ sender: Any) {
        
        guard nameTextField.text != "" else {
            
            Toast.show(message: "Please, enter your name", controller: self)
            return
        }
        
        guard phoneTextField.text != "" else {
            
            Toast.show(message: "Please, enter your phone", controller: self)
            return
        }
        
        guard  mailTextField.text != "" else {
            
            Toast.show(message: "Please, enter your mail", controller: self)
            return
        }
        
        guard  passwordTextField.text != "" else {
            
            Toast.show(message: "Please, enter password", controller: self)
            return
        }
        
        guard  passwordTextField.text != "" else {
            
            Toast.show(message: "Please, enter password confirmation", controller: self)
            return
        }
        
        guard  passwordTextField.text == confirmPasswordTextField.text else {
            
            Toast.show(message: "Sorry, password do not match.", controller: self)
            return
        }
        
        let randomInt = Int.random(in: 100..<999)
        
        
        var newUser = UserToRegister()
        newUser.email = self.mailTextField.text!
        newUser.password = self.passwordTextField.text!
        newUser.passwordConfirmation = self.passwordTextField.text!
        newUser.phone = self.phoneTextField.text!
        newUser.fullName = self.nameTextField.text!
        newUser.accountName = self.nameTextField.text! + "\(randomInt)"
        newUser.accountType = "Normal"
        
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let continueRegister = storyBoard.instantiateViewController(withIdentifier: "ContinueRegisterVC") as! ContinueRegisterVC
        continueRegister.newUser = newUser
        self.navigationController?.pushViewController(continueRegister, animated: true)
        

    }
    

}


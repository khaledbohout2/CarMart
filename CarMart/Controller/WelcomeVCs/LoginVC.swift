//
//  LoginVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 25/01/2021.
//

import UIKit
import JGProgressHUD

class LoginVC: UIViewController {
    
    var passShown = false
    
    var hud = JGProgressHUD(style: .extraLight)

    @IBOutlet weak var phoneNumTxtField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var loginPresenter = LoginPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginPresenter.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.isHidden = true
    }

    @IBAction func enterBtnTapped(_ sender: Any) {
        
        if passShown {
            
            guard self.phoneNumTxtField.text != "" else {
                
                Toast.show(message: "Please enter your Phone or mail", controller: self)
                return
            }
            
            guard self.passwordTextField.text != "" else {
                
                Toast.show(message: "Please enter your password", controller: self)
                return
            }
            
            if Reachable.isConnectedToNetwork() {
            
            hud.textLabel.text = "loading"
            hud.show(in: self.view)
            
            let req = loginUserRequest(mail: self.phoneNumTxtField.text!, pass: self.passwordTextField.text!)
            
                self.loginPresenter.loginUser(req: req)
                
            } else {
                
                Toast.show(message: "No Internet, Please try again", controller: self)
            }
            
            
        } else {
            
            guard self.phoneNumTxtField.text != "" else {
                
                Toast.show(message: "Please enter your Phone or mail", controller: self)
                return
            }
            
            if Reachable.isConnectedToNetwork() {
                
                hud.textLabel.text = "loading"
                hud.show(in: self.view)
            
            let req = CheckUserExistenceRequest(mail: self.phoneNumTxtField.text!)
            
                self.loginPresenter.checkMobileExistence(req: req)
                
            } else {
                
                Toast.show(message: "No internet", controller: self)
            }
            
        }
    }
}

//MARK:- APIs

extension LoginVC: LoginDelegate {
    
    func CheckUserExistence(success: Bool) {
        
        if success {
            
            hud.dismiss()
            
        } else {
            
            hud.dismiss()
            
            Toast.show(message: "Some error Happened, Please try again later", controller: self)
        }
    }
    
    
    func userExists(exists: Bool) {
        
        if exists {
            
            self.passwordTextField.isHidden = false
            self.passShown = true
            
        } else {
            
            let storyBaord = UIStoryboard(name: "Main", bundle: nil)
            let chooseServiceVC = storyBaord.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
            self.navigationController?.pushViewController(chooseServiceVC, animated: true)
        }
    }
    
    func loginUserSuccess(success: Bool) {
        
        if success {
            
            hud.dismiss()
            
        } else {
            
            hud.dismiss()
            Toast.show(message: "Some error Happened, Please try again later", controller: self)
        }
    }
    
    func loginUser(response: LoginResponse) {
        
        if response.error != nil {
            
            Toast.show(message: "Sorry, password is wrong, try another time", controller: self)
            
        } else {
        
        let storyBaord = UIStoryboard(name: "Main", bundle: nil)
        let categoriesVC = storyBaord.instantiateViewController(withIdentifier: "CategoriesVC") as! CategoriesVC
        self.navigationController?.pushViewController(categoriesVC, animated: true)
        }
        
    }
    

}


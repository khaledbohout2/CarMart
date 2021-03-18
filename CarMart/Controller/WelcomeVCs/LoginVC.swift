//
//  LoginVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 25/01/2021.
//

import UIKit
import JGProgressHUD
import GoogleSignIn

class LoginVC: UIViewController {
    
    var passShown = false
    
    var hud = JGProgressHUD(style: .extraLight)

    @IBOutlet weak var phoneNumTxtField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var loginPresenter = LoginPresenter()
    var loginMethod: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginPresenter.delegate = self
        phoneNumTxtField.delegate = self
        // Do any additional setup after loading the view.
        
     //   GIDSignIn.sharedInstance()?.presentingViewController = self

        // Automatically sign in the user.
    //    GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
   //     GIDSignIn.sharedInstance().delegate = self
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
    
    @IBAction func resetPasswordBtnTapped(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let entrerMobileVC = storyBoard.instantiateViewController(withIdentifier: "EntrerMobileVC")
        self.navigationController?.pushViewController(entrerMobileVC, animated: true)
    }
    
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == phoneNumTxtField {
        
        self.passShown = false
        self.passwordTextField.isHidden = true
        }
    }
}

//MARK: - google delegate

extension LoginVC: GIDSignInDelegate

{
    /**
       func that sign in with google
      - Parameters :
      - zero parameters
      */
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
      if let error = error {
        if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
          print("The user has not signed in before or they have since signed out.")
        } else {
          print("\(error.localizedDescription)")
        }
        return
      }
      // Perform any operations on signed in user here.
 //     let userId = user.userID                  // For client-side use only!
      let idToken = user.authentication.idToken// Safe to send to the server
        
      let fullName = user.profile.name
  //    let givenName = user.profile.givenName
    //  let familyName = user.profile.familyName
        let email = user.profile.email!
        
        self.loginMethod = "gmail"
        
        let req = CheckUserExistenceRequest(mail: email)
        
        self.loginPresenter.checkMobileExistence(req: req)
        
    }
    
    /**
       func that called when google returns error
      - Parameters :
      - zero parameters
      */
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
      // Perform any operations when the user disconnects from app here.
      // ...
    }
    
    /**
           this IBAction calls when user tapps did Tap SignOut from google
           - Parameters:
           - sender : the button that intiate the action.
           */
    
    @IBAction func didTapSignOut(_ sender: AnyObject) {
        
      GIDSignIn.sharedInstance().signOut()
        
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
            categoriesVC.userName = response.userName
            categoriesVC.profileImageLink = response.profileImage
        self.navigationController?.pushViewController(categoriesVC, animated: true)
        }
        
    }
    

}


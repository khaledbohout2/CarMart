//
//  EntrerMobileVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 18/03/2021.
//

import UIKit
import JGProgressHUD

class EntrerMobileVC: UIViewController {

    @IBOutlet weak var phonTextField: UITextField!
    
    var hud = JGProgressHUD(style: .extraLight)
    
    var enterMobilePresenter = EnterMobilePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.enterMobilePresenter.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func creatCode() {
        
        let req = CreateResetPasswordCodeRequest(mail: self.phonTextField.text!)
        self.enterMobilePresenter.createResetPassword(req: req)
    }

    @IBAction func enterMobileTapped(_ sender: Any) {
        
        guard phonTextField.text != "" else {
            Toast.show(message: "please enter mobile phone", controller: self)
            return
        }
        
        if Reachable.isConnectedToNetwork() {
            
            hud.show(in: self.view, animated: true)
            creatCode()
            
        } else {
            
            Toast.show(message: "no internet", controller: self)
        }
    }
    
}

extension EntrerMobileVC : EnterMobileDelegate {
    
    func creatCodeSuccess(success: Bool) {
        if success {
            hud.dismiss()
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let enterVerificationCodeVC = storyBoard.instantiateViewController(withIdentifier: "EnterVerificationCodeVC")
            self.navigationController?.pushViewController(enterVerificationCodeVC, animated: true)
        } else {
            hud.dismiss()
            Toast.show(message: "some error happened, please try again", controller: self)
        }
    }
    
    
    
}

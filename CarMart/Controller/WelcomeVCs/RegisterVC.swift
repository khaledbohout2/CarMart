//
//  RegisterVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 14/03/2021.
//

import UIKit

class RegisterVC: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    

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
        
        guard  mailTextField.text != "Please, enter your mail" else {
            
            Toast.show(message: "", controller: self)
            return
        }
        
    }
    

}

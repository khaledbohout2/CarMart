//
//  LoginVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 25/01/2021.
//

import UIKit

class LoginVC: UIViewController {
    
    var passShown = false

    @IBOutlet weak var phoneNumTxtField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.isHidden = true
    }

    @IBAction func enterBtnTapped(_ sender: Any) {
        
        if passShown {
            
            let storyBaord = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBaord.instantiateViewController(withIdentifier: "HomeTBC")
            vc.modalPresentationStyle =  .fullScreen
            self.present(vc, animated: true, completion: nil)
            
        } else {
            
            if phoneNumTxtField.text == "111" {
                
                passwordTextField.isHidden = false
                passShown = true
                
            } else {
                
                let storyBaord = UIStoryboard(name: "Main", bundle: nil)
                let chooseServiceVC = storyBaord.instantiateViewController(withIdentifier: "ChooseServiceVC") as! ChooseServiceVC
                self.navigationController?.pushViewController(chooseServiceVC, animated: true)
                self.present(chooseServiceVC, animated: true, completion: nil)
            }
        }
        
    }
    
}


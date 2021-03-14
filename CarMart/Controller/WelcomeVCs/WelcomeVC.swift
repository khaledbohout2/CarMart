//
//  WelcomeVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 14/03/2021.
//

import UIKit

class WelcomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signInBtnTapped(_ sender: Any) {
        
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = mainStoryBoard.instantiateViewController(withIdentifier: "LoginVC")
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @IBAction func exploreBtnTapped(_ sender: Any) {
        
        let mainStoryBoard = UIStoryboard(name: "Home", bundle: nil)
        let homeVC = mainStoryBoard.instantiateViewController(withIdentifier: "HomeVC")
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
}

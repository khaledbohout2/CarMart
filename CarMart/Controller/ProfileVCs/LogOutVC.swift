//
//  LogOutVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 09/02/2021.
//

import UIKit

class LogOutVC: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.3)
        mainView.backgroundColor = UIColor(white: 1, alpha: 1.0)

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func yesBtnTapped(_ sender: Any) {
        
        logout()
        self.view.removeFromSuperview()
        self.navigationController?.popToRootViewController(animated: true)
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func notBtnTapped(_ sender: Any) {
        
        self.view.removeFromSuperview()
    }
    


}

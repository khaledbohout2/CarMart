//
//  FastMaintenanceVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 31/01/2021.
//

import UIKit

class FastMaintenanceVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sentBtnTapped(_ sender: Any) {
        
      //  CarHelpVC
        
        let storiBoard = UIStoryboard(name: "Home", bundle: nil)
        let carHelpVC = storiBoard.instantiateViewController(withIdentifier: "CarHelpVC") as! CarHelpVC
        self.navigationController?.pushViewController(carHelpVC, animated: true)
    }
    

}

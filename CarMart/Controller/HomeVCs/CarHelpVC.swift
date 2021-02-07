//
//  CarHelpVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 04/02/2021.
//

import UIKit

class CarHelpVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func sendBtnTapped(_ sender: Any) {
    //    BookServicesVC
        
        let storiBoard = UIStoryboard(name: "Home", bundle: nil)
        let bookServicesVC = storiBoard.instantiateViewController(withIdentifier: "BookServicesVC") as! BookServicesVC
        self.navigationController?.pushViewController(bookServicesVC, animated: true)
        
    }


}

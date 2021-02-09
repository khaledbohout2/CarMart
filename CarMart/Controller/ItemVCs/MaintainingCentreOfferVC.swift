//
//  MaintainingCentreOfferVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 09/02/2021.
//

import UIKit

class MaintainingCentreOfferVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func bookNowBtnTapped(_ sender: Any) {
        
            let storiBoard = UIStoryboard(name: "Item", bundle: nil)
            let bookOfferVC = storiBoard.instantiateViewController(withIdentifier: "BookServicesVC") as! BookServicesVC
            self.navigationController?.pushViewController(bookOfferVC, animated: true)
    }
    



}

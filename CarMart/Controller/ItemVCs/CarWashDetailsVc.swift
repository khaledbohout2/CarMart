//
//  CarWashDetailsVc.swift
//  CarMart
//
//  Created by Khaled Bohout on 10/02/2021.
//

import UIKit

class CarWashDetailsVc: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false

        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func nextBtnTapped(_ sender: Any) {
        
        let storiBoard = UIStoryboard(name: "Item", bundle: nil)
        let bookOfferVC = storiBoard.instantiateViewController(withIdentifier: "BookCarWashVC") as! BookCarWashVC
        self.navigationController?.pushViewController(bookOfferVC, animated: true)
    }
    

}

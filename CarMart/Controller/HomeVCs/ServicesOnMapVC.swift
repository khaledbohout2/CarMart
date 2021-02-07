//
//  ServicesOnMapVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 03/02/2021.
//

import UIKit
import MapKit

class ServicesOnMapVC: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var servicesCollectionView: UICollectionView!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func startBtnTapped(_ sender: Any) {
    }
    
}

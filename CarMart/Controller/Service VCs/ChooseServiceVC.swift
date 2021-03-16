//
//  ChooseServiceVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 26/01/2021.
//

import UIKit
import DropDown

class ChooseServiceVC: UIViewController {

    @IBOutlet weak var phoneNumTxtField: UITextField!
    @IBOutlet weak var nameTxtField: UITextField!

    @IBOutlet weak var careDropDownBtn: UIButton!
    @IBOutlet weak var colorDropDownBtn: UIButton!
    @IBOutlet weak var yearDropDownBtn: UIButton!
    
    var careDropDown = DropDown()
    var colorDropDown = DropDown()
    var yearDropDown = DropDown()
    
    var care: String?
    var color: String?
    var year: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCareDropDown()
        setUpColorDropDown()
        setUpYearDropDown()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.isHidden = true
        
    }
    

    
    func setUpCareDropDown() {
        
        DropDown.appearance().backgroundColor = hexStringToUIColor(hex: "#FFFFFF")
        
        careDropDown.anchorView = careDropDownBtn
        careDropDown.bottomOffset = CGPoint(x: 0, y: (careDropDown.anchorView?.plainView.bounds.height)!)
        careDropDown.dataSource = ["Car", "Motorcycle", "Truck"]
        
        careDropDown.selectionAction = { [weak self] (index, item) in
            
            
            self?.careDropDownBtn.setTitle(item, for: .normal)
            self!.care = item
        }
    }
    
    func setUpColorDropDown() {
        
        colorDropDown.anchorView = colorDropDownBtn
        colorDropDown.bottomOffset = CGPoint(x: 0, y: (colorDropDown.anchorView?.plainView.bounds.height)!)
        colorDropDown.dataSource = ["Car", "Motorcycle", "Truck"]
        
        colorDropDown.selectionAction = { [weak self] (index, item) in
            
            if index == 0 {
               // Helper.showAlert("خطأ", message: "من فضلك إختار المدينه", VC: self!)
                return
            }
            
            self?.colorDropDownBtn.setTitle(item, for: .normal)
            self?.color = item
        }
    }
    
    func setUpYearDropDown() {
        
        yearDropDown.anchorView = yearDropDownBtn
        yearDropDown.bottomOffset = CGPoint(x: 0, y: (yearDropDown.anchorView?.plainView.bounds.height)!)
        yearDropDown.dataSource = ["Car", "Motorcycle", "Truck"]
        
        yearDropDown.selectionAction = { [weak self] (index, item) in
            
            if index == 0 {
               // Helper.showAlert("خطأ", message: "من فضلك إختار المدينه", VC: self!)
                return
            }
            
            self?.yearDropDownBtn.setTitle(item, for: .normal)
            self?.year = item
        }
    }
    
    @IBAction func careDropDownBtnTapped(_ sender: Any) {
        careDropDown.show()
    }
    
    @IBAction func colorDropDownBtnTapped(_ sender: Any) {
        colorDropDown.show()
    }
    
    @IBAction func yearDropDownTapped(_ sender: Any) {
        
        yearDropDown.show()
    }
    

    
    @IBAction func enterBtnTapped(_ sender: Any) {
        
        let storyBaord = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBaord.instantiateViewController(withIdentifier: "HomeTBC")
        vc.modalPresentationStyle =  .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}



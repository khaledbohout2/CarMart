//
//  ChooseServiceVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 26/01/2021.
//

import UIKit
import DropDown

class ChooseServiceVC: UIViewController {
    
    @IBOutlet weak var servicesCollectionView: UICollectionView!
    @IBOutlet weak var phoneNumTxtField: UITextField!
    @IBOutlet weak var nameTxtField: UITextField!

    @IBOutlet weak var careDropDownBtn: UIButton!
    @IBOutlet weak var colorDropDownBtn: UIButton!
    @IBOutlet weak var yearDropDownBtn: UIButton!
    
    var careDropDown = DropDown()
    var colorDropDown = DropDown()
    var yearDropDown = DropDown()
    
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
        
        setUpCollectionView()
    }
    
    func setUpCollectionView() {
        
        let categoriesNib = UINib(nibName: "ServicesCollectionViewCell", bundle: nil)
        servicesCollectionView.register(categoriesNib, forCellWithReuseIdentifier: "ServicesCollectionViewCell")
        servicesCollectionView.delegate = self
        servicesCollectionView.dataSource = self
        
    }
    
    func setUpCareDropDown() {
        
        DropDown.appearance().backgroundColor = hexStringToUIColor(hex: "#FFFFFF")
        
        careDropDown.anchorView = careDropDownBtn
        careDropDown.bottomOffset = CGPoint(x: 0, y: (careDropDown.anchorView?.plainView.bounds.height)!)
        careDropDown.dataSource = ["Car", "Motorcycle", "Truck"]
        
        careDropDown.selectionAction = { [weak self] (index, item) in
            
            
            self?.careDropDownBtn.setTitle(item, for: .normal)
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

extension ChooseServiceVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServicesCollectionViewCell", for: indexPath) as! ServicesCollectionViewCell
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: ((collectionView.frame.width) / 5), height: (collectionView.frame.height - 20))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //item
        
      //  BookOfferVC
        
        let storyBaord = UIStoryboard(name: "Item", bundle: nil)
        let bookOfferVC = storyBaord.instantiateViewController(withIdentifier: "BookOfferVC")
        
        self.navigationController?.pushViewController(bookOfferVC, animated: true)
    }
    
    
}

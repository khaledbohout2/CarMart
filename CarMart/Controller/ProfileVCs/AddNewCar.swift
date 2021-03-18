//
//  AddNewCar.swift
//  CarMart
//
//  Created by Khaled Bohout on 09/02/2021.
//

import UIKit
import DropDown
import JGProgressHUD

class AddNewCar: UIViewController {
    
    var hud = JGProgressHUD(style: .extraLight)
    
    @IBOutlet weak var carBrandBtn: UIButton!
    @IBOutlet weak var carModelBtn: UIButton!
    @IBOutlet weak var carYearBtn: UIButton!
    
    
    var brandDropDown = DropDown()
    var modelDropDown = DropDown()
    var yearDropDown = DropDown()
    
    var brandsArr = [String]()
    var modelsArr = [String]()
    var yearsArr = [String]()
    
    var selectedBrand: String?
    var selectedModel: String?
    var selectedYear: String?
    
    var selectedCarId: String?
    
    let addNewCarPresenter = AddNewCarPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCarsBrands()

        // Do any additional setup after loading the view.
    }
    
    func getCarsBrands() {
        
        addNewCarPresenter.delegate = self
        
        if Reachable.isConnectedToNetwork() {
        
        addNewCarPresenter.getCarBrands(req: GetCarsBrandsRequest())
            
        } else {
            
            Toast.show(message: "No Internet", controller: self)
        }
    }

    
    func setUpCarDropDown() {
        
        DropDown.appearance().backgroundColor = hexStringToUIColor(hex: "#FFFFFF")
        
        brandDropDown.anchorView = carBrandBtn
        brandDropDown.bottomOffset = CGPoint(x: 0, y: (brandDropDown.anchorView?.plainView.bounds.height)!)
        brandDropDown.dataSource = self.brandsArr
        
        brandDropDown.selectionAction = { [weak self] (index, item) in
            
            self?.carBrandBtn.setTitle(item, for: .normal)
            self?.selectedModel = ""
            self?.carBrandBtn.setTitle("", for: .normal)
            self?.selectedYear = ""
            self?.carBrandBtn.setTitle("", for: .normal)
            self!.selectedBrand = item
            
            if Reachable.isConnectedToNetwork() {
                
                self!.hud.textLabel.text = "loading"
                
                self!.hud.show(in: (self?.view)!)
                
            self!.addNewCarPresenter.getCarModels(req: GetCarBrandModelsRequest(brand: item))
                
            } else {
                Toast.show(message: "No Internet, Please try again", controller: self!)
            }
        }
    }
    
    func setUpModelDropDown() {
        
        modelDropDown.anchorView = carModelBtn
        modelDropDown.bottomOffset = CGPoint(x: 0, y: (modelDropDown.anchorView?.plainView.bounds.height)!)
        modelDropDown.dataSource = self.modelsArr
        
        modelDropDown.selectionAction = { [weak self] (index, item) in
            
            self?.carModelBtn.setTitle(item, for: .normal)
            
            self?.selectedModel = item
            
            let req = GetCarYearsRequest(brand: (self?.selectedBrand)!, model: item)
            
            if Reachable.isConnectedToNetwork() {
                
                self!.hud.textLabel.text = "loading"
                self?.hud.show(in: self!.view)
                
                self?.addNewCarPresenter.getCarYears(req: req)
            }
            
            
        }
    }
    
    func setUpYearDropDown() {
        
        yearDropDown.anchorView = carYearBtn
        yearDropDown.bottomOffset = CGPoint(x: 0, y: (yearDropDown.anchorView?.plainView.bounds.height)!)
        yearDropDown.dataSource = self.yearsArr
        
        yearDropDown.selectionAction = { [weak self] (index, item) in
            
            self?.carYearBtn.setTitle(item, for: .normal)
            self?.selectedYear = item
            let req = GetCarIdRequest(brand: self!.selectedBrand!, model: self!.selectedModel!, year: self!.selectedYear!)
            
            if Reachable.isConnectedToNetwork() {
                
            self?.addNewCarPresenter.getCarId(req: req)
                
            } else {
                
                Toast.show(message: "No Internet", controller: self!)
            }
        }
    }

    
    //MARK: - IBActions
    
    @IBAction func carBrandBtnTapped(_ sender: Any) {
        self.brandDropDown.show()
    }
    
    
    @IBAction func carModelBtnTapped(_ sender: Any) {
        self.modelDropDown.show()
    }
    
    @IBAction func carYearBtnTapped(_ sender: Any) {
        self.yearDropDown.show()
    }
    
    @IBAction func saveBtnTapped(_ sender: Any) {
        
        guard self.selectedCarId != nil else {
            
            Toast.show(message: "please select car data", controller: self)
            return
        }
        
        if Reachable.isConnectedToNetwork() {
            
            hud.textLabel.text = "loading"
            hud.show(in: self.view)
            
            let req = AddUserCarRequest(carID: self.selectedCarId!)
            
            self.addNewCarPresenter.addNewCar(req: req)
        }
    }
    
    
}

extension AddNewCar: AddNewCarDelegate {
    
    
    func getCarBrandsSuccess(success: Bool) {
        
        if success {
            
            hud.dismiss()
            
        } else {
            
            hud.dismiss()
            Toast.show(message: "Sorry, dome error happened please try again later", controller: self)
        }
    }
    
    func passCarBrands(brands: [String]) {
        
        self.brandsArr = brands
        
        setUpCarDropDown()
        
    }
    
    func getCarModelsSuccess(success: Bool) {
        
        if success {
            
            hud.dismiss()
            
        } else {
            
            hud.dismiss()
            Toast.show(message: "Sorry, dome error happened please try again later", controller: self)
        }
    }
    
    func passCarModels(models: [String]) {
        
        self.modelsArr = models
        
        setUpModelDropDown()
    }
    
    func getCarYearsSuccess(success: Bool) {
        
        if success {
            
            hud.dismiss()
            
        } else {
            
            hud.dismiss()
            Toast.show(message: "Sorry, dome error happened please try again later", controller: self)
        }
    }
    
    func passCarYears(years: [String]) {
        
        self.yearsArr = years
        
        setUpYearDropDown()
    }
    
    func getCarIdsuccess(success: Bool) {
        
        if success {
            
            hud.dismiss()
            
        } else {
            
            hud.dismiss()
            Toast.show(message: "Sorry, dome error happened please try again later", controller: self)
        }
    }
    
    func passCarId(carId: Int) {
        
        self.selectedCarId = "\(carId)"
    }
    
    func addCarSuccess(success: Bool) {
        
        if success {
            
            hud.dismiss()
            
            self.navigationController?.popViewController(animated: true)
            
        } else {
            
            hud.dismiss()
            
            Toast.show(message: "Sorry, some error happened. please try again.", controller: self)
        }
    }
}

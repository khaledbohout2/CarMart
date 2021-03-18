//
//  ContinueRegisterVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 15/03/2021.
//



import UIKit
import DropDown
import JGProgressHUD

class ContinueRegisterVC: UIViewController {

    @IBOutlet weak var carDropDownBtn: UIButton!
    @IBOutlet weak var colorDropDownBtn: UIButton!
    @IBOutlet weak var yearDropDownBtn: UIButton!
    
    var hud = JGProgressHUD(style: .extraLight)
    var continueRegisterPresenter = ContinueRegisterPresenter()
    
    var careDropDown = DropDown()
    var colorDropDown = DropDown()
    var yearDropDown = DropDown()
    
    var brandsArr = [String]()
    var modelsArr = [String]()
    var yearsArr = [String]()
    
    var car : String?
    var model : String?
    var year : String?
    var carId: String?
    
    var newUser: UserToRegister?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.continueRegisterPresenter.delegate = self
        
        if Reachable.isConnectedToNetwork() {
            
            hud.textLabel.text = "loading"
            hud.show(in: self.view)
            
            self.continueRegisterPresenter.getCarBrands(req: GetCarsBrandsRequest())
            
        } else {
            
            Toast.show(message: "No Internet", controller: self)
        }
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.isHidden = true
        
    }
    

    func setUpCarDropDown() {
        
        DropDown.appearance().backgroundColor = hexStringToUIColor(hex: "#FFFFFF")
        
        careDropDown.anchorView = carDropDownBtn
        careDropDown.bottomOffset = CGPoint(x: 0, y: (careDropDown.anchorView?.plainView.bounds.height)!)
        careDropDown.dataSource = self.brandsArr
        
        careDropDown.selectionAction = { [weak self] (index, item) in
            
            self?.carDropDownBtn.setTitle(item, for: .normal)
            self?.model = ""
            self?.colorDropDownBtn.setTitle("", for: .normal)
            self?.year = ""
            self?.yearDropDownBtn.setTitle("", for: .normal)
            self!.car = item
            
            if Reachable.isConnectedToNetwork() {
                
                self!.hud.textLabel.text = "loading"
                
                self!.hud.show(in: (self?.view)!)
                
            self!.continueRegisterPresenter.getCarModels(req: GetCarBrandModelsRequest(brand: item))
                
            } else {
                Toast.show(message: "No Internet, Please try again", controller: self!)
            }
        }
    }
    
    func setUpModelDropDown() {
        
        colorDropDown.anchorView = colorDropDownBtn
        colorDropDown.bottomOffset = CGPoint(x: 0, y: (colorDropDown.anchorView?.plainView.bounds.height)!)
        colorDropDown.dataSource = self.modelsArr
        
        colorDropDown.selectionAction = { [weak self] (index, item) in
            
            self?.colorDropDownBtn.setTitle(item, for: .normal)
            
            self?.model = item
            
            let req = GetCarYearsRequest(brand: (self?.car)!, model: item)
            
            if Reachable.isConnectedToNetwork() {
                
                self!.hud.textLabel.text = "loading"
                self?.hud.show(in: self!.view)
                
                self?.continueRegisterPresenter.getCarYears(req: req)
            }
            
            
        }
    }
    
    func setUpYearDropDown() {
        
        yearDropDown.anchorView = yearDropDownBtn
        yearDropDown.bottomOffset = CGPoint(x: 0, y: (yearDropDown.anchorView?.plainView.bounds.height)!)
        yearDropDown.dataSource = self.yearsArr
        
        yearDropDown.selectionAction = { [weak self] (index, item) in
            
            self?.yearDropDownBtn.setTitle(item, for: .normal)
            self?.year = item
            let req = GetCarIdRequest(brand: self!.car!, model: self!.model!, year: self!.year!)
            
            if Reachable.isConnectedToNetwork() {
                
            self?.continueRegisterPresenter.getCarId(req: req)
                
            } else {
                
                Toast.show(message: "No Internet", controller: self!)
            }
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
        
        guard self.car != nil else {
            
            Toast.show(message: "Please select car", controller: self)
            return
        }
        
        guard self.model != nil else {
            
            Toast.show(message: "Please select car color", controller: self)
            return
        }
        
        guard self.year != nil else {
            
            Toast.show(message: "Please select car year", controller: self)
            return
        }
        
        self.newUser?.carID = carId
        
        let req = RegisterUserRequest(userToRegister: newUser!)
        
        if Reachable.isConnectedToNetwork() {
            
            hud.textLabel.text = "loading"
            hud.show(in: self.view)
            
        self.continueRegisterPresenter.registerUser(req: req)
            
        } else {
            
            Toast.show(message: "No Internet", controller: self)
        }
        
    }
    
    @IBAction func skipButtonTapped(_ sender: Any) {
        
        let req = RegisterUserRequest(userToRegister: newUser!)

        if Reachable.isConnectedToNetwork() {

            hud.textLabel.text = "loading"
            hud.show(in: self.view)

        self.continueRegisterPresenter.registerUser(req: req)

        } else {

            Toast.show(message: "No Internet", controller: self)
        }
        

    }
}


extension ContinueRegisterVC: ContinueRegisterDelegate {
    
    func registerUserSuccess(success: Bool) {
        
        if success {
            
            hud.dismiss()
            
        } else {
            
            hud.dismiss()
            
            Toast.show(message: "sorry!, some error happened, please try again.", controller: self)
        }
        
    }
    
    func registerUser(user: RegisterResponse) {
        
        if user.error != nil {
            
            Toast.show(message: "some error happened, please try again later", controller: self)
            
        } else {
            
            setUserData(user: user)
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let categoriesVC = storyBoard.instantiateViewController(withIdentifier: "CategoriesVC") as! CategoriesVC
        self.navigationController?.pushViewController(categoriesVC, animated: true)
            
            
        }
        
    }
    
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
        
        self.carId = "\(carId)"
    }
    
    
    
}

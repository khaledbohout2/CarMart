//
//  MyGarageVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 09/02/2021.
//

import UIKit
import JGProgressHUD

class MyGarageVC: UIViewController {
    
    @IBOutlet weak var carsCollectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var carInfoLbl: UILabel!
    
    var garagePresenter = GaragePresenter()
    
    var hud = JGProgressHUD()
    
    var carsArr = [CarModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initCollectionView()
        setPageControllDotsBorder()
        setUpNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getUserGarage()
    }
    
    func initCollectionView() {
    
    let pannersNib = UINib(nibName: "PannersCollectionViewCell", bundle: nil)
        carsCollectionView.register(pannersNib, forCellWithReuseIdentifier: "PannersCollectionViewCell")
        carsCollectionView.delegate = self
        carsCollectionView.dataSource = self

    }
    
    /**
       func that set custom appearnce for view's navigation Bar
      - Parameters :
      - zero parameters
      */
    
    func setUpNavigation() {
        
    //    navigationController?.navigationBar.prefersLargeTitles = true

        if #available(iOS 13.0, *) {
            
            let appearance = UINavigationBarAppearance()
            
            appearance.backgroundColor = hexStringToUIColor(hex: "#204BF6")
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
         //   appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            

            navigationController?.navigationBar.tintColor = .white
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            
        } else {
            // Fallback on earlier versions
                self.navigationController?.navigationBar.backgroundColor = hexStringToUIColor(hex: "#F4F6F8")
        }


        let fontSize: CGFloat

        if self.view.frame.width > 500 {
            fontSize = 27
        } else {
            fontSize = 18
        }
//

    //        self.navigationItem.title = "notifications".localizableString()
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: hexStringToUIColor(hex: "#FFFFFF"),
                                                                            NSAttributedString.Key.font: UIFont(name: "Poppins-Regular".localizableString(), size: fontSize)!]
        
        self.title = "My Grash"
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        let back = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(backTapped))
        back.image = UIImage(named: "ArrowLeft".localizableString())
        back.tintColor = hexStringToUIColor(hex: "#FFFFFF")
        navigationItem.leftBarButtonItem = back
        
    }

    
    func getUserGarage() {
        
        garagePresenter.delegate = self
        
        if Reachable.isConnectedToNetwork() {
            
            hud.textLabel.text = "loading"
            hud.show(in: self.view)
            garagePresenter.getUserCars(req: GetUserGarageRequest())
            
        } else {
            
            Toast.show(message: "No Internet", controller: self)
        }
    }
    
    func setPageControllDotsBorder() {
        
        if #available(iOS 14.0, *) {
            pageControl.currentPageIndicatorTintColor = hexStringToUIColor(hex: "#204BF6")
            pageControl.pageIndicatorTintColor = hexStringToUIColor(hex: "#204BF6").withAlphaComponent(0.3)
                } else {
                    // Fallback on earlier versions
                    for index: Int in 0...3 {
                        guard pageControl.subviews.count > index else { return }
                        let dot: UIView = pageControl.subviews[index]
                        dot.layer.cornerRadius = dot.frame.size.height / 2
                        if index == pageControl.currentPage {
                            dot.backgroundColor = hexStringToUIColor(hex: "#204BF6")
                            dot.layer.borderWidth = 0
                        } else {
                            dot.backgroundColor = UIColor.clear
                            dot.layer.borderColor = hexStringToUIColor(hex: "#204BF6").cgColor
                            dot.layer.borderWidth = 1
                        }
                    }
        }
    }
    
    @IBAction func addNewCarTapped(_ sender: Any) {
        
        let profileStoryBoard = UIStoryboard(name: "Profile", bundle: nil)
        let addNewCarVC = profileStoryBoard.instantiateViewController(withIdentifier: "AddNewCar")
        self.navigationController?.pushViewController(addNewCarVC, animated: true)
    }
    
    /**
           this IBAction calls when user tapps back button which pop view controller
           - Parameters:
           - sender : the button that intiate the action.
           */
    
    @objc func backTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    

}

extension MyGarageVC: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return carsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PannersCollectionViewCell", for: indexPath) as! PannersCollectionViewCell
        
        let imageLink = carsArr[indexPath.row].imageLink
        cell.bannerImageView.sd_setImage(with: URL(string: URLS.carURL + imageLink), placeholderImage: UIImage(named: "placeholder"), options: [.fromLoaderOnly])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        pageControl.currentPage = Int(indexPath.row)
        let car = carsArr[indexPath.row]
        self.carInfoLbl.text = car.year + " " + car.brand + " " + car.model
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
}

extension MyGarageVC: GarageDelegate {
    
    func getCarsSuccess(success: Bool) {
        
        if success {
            
            hud.dismiss()
            
        } else {
            
            hud.dismiss()
            
            Toast.show(message: "some error happened, please try again", controller: self)
        }
    }
    
    func passCars(cars: [CarModel]) {
        
        self.carsArr = cars
        pageControl.numberOfPages = cars.count
        self.carsCollectionView.reloadData()
    }
    
    
}

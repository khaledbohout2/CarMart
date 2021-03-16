//
//  HomeVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 25/01/2021.
//

import UIKit
import Gifu
import AutoScrollCollectionView
import JGProgressHUD

/// HomeVC

class HomeVC: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var exploreCollectionView: UICollectionView!
    @IBOutlet weak var bestSellerCollectionView: UICollectionView!
    @IBOutlet weak var featuredBrandsCollectionView: UICollectionView!
    @IBOutlet weak var newArrivalsCollectionView: UICollectionView!
    //   @IBOutlet weak var loaderImageView: GIFImageView!
    @IBOutlet weak var pannersCollectionView: UICollectionView!
    
    var hud = JGProgressHUD()
    
    //MARK: - Vars
    
    var mySubview = UIView()
    var loaderGIF = GIFImageView()
    
    var specificationsArr = [Specification]()

 //   var categories = [CategoryElement]()
    var freeOffers = [OfferModel]()
    var paidOffers = [OfferModel]()
    var hotOffers = [OfferModel]()
    var brands = [Brand]()
    var pannersArr = [String]()
    var categoryIndex = "1"
    
    var brandColors = ["#2BB49D", "#4089E8", "#E95FA4", "#F6C677"]
    
    let homePresenter = HomePresenter()
    
    //MARK: - view life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        localize()
                
        initCollectionViews()
        setUpNavigation()
        homePresenter.delegate = self
        
        if Reachable.isConnectedToNetwork() {
            
            hud.textLabel.text = "loading"
            hud.show(in: self.view)
            
            let req = GetAllSpeceficationsRequest()
            
            homePresenter.getAllSpecifications(req: req)
            
        } else {
            
            Toast.show(message: "noInternet".localizableString(), controller: self)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
     //   self.pannersCollectionView.scrollToItem(at:IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: false)
        
        self.tabBarController?.tabBar.isHidden = false
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
   //     self.pannersCollectionView.scrollToItem(at:IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: false)
        
        self.tabBarController?.tabBar.isHidden = false
    }
    
    //MARK: - Methods
    
    /**
       func that set custom appearnce for view's navigation Bar
      - Parameters :
      - zero parameters
      */
    
    func setUpNavigation() {
        
    //    navigationController?.navigationBar.prefersLargeTitles = true

        if #available(iOS 13.0, *) {
            
            let appearance = UINavigationBarAppearance()
            
            appearance.backgroundColor = hexStringToUIColor(hex: "#F4F6F8")
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


        
//        let backBtn = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(backTapped))
//        backBtn.image = UIImage(named: "ArrowLeft".localizableString())
//        backBtn.tintColor = hexStringToUIColor(hex: "#000000")
//        navigationItem.leftBarButtonItem = backBtn
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let height = CGFloat(100)
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: height)
    }
    
    /**
       func that make localization for all subviews
      - Parameters :
      - zero parameters
      */
    
    func localize() {
        

    }
    
    /**
       func that init collection views and register custom cells
      - Parameters :
      - zero parameters
      */
    
    func initCollectionViews() {
        
        let pannersNib = UINib(nibName: "PannersCollectionViewCell", bundle: nil)
        pannersCollectionView.register(pannersNib, forCellWithReuseIdentifier: "PannersCollectionViewCell")
        pannersCollectionView.delegate = self
        pannersCollectionView.dataSource = self
        
        let categoryNib = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        exploreCollectionView.register(categoryNib, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        exploreCollectionView.delegate = self
        exploreCollectionView.dataSource = self
      //  pannersCollectionView.scrollToItem(at:IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: false)
        
        let FeatureBrandsNib = UINib(nibName: "FeatureBrandsCollectionViewCell", bundle: nil)
        featuredBrandsCollectionView.register(FeatureBrandsNib, forCellWithReuseIdentifier: "FeatureBrandsCollectionViewCell")
        featuredBrandsCollectionView.delegate = self
        featuredBrandsCollectionView.dataSource = self
        
        let bestSellingNib = UINib(nibName: "CollectionViewCell", bundle: nil)
        newArrivalsCollectionView.register(bestSellingNib, forCellWithReuseIdentifier: "CollectionViewCell")
        newArrivalsCollectionView.delegate = self
        newArrivalsCollectionView.dataSource = self
        
        bestSellerCollectionView.register(bestSellingNib, forCellWithReuseIdentifier: "CollectionViewCell")
        bestSellerCollectionView.delegate = self
        bestSellerCollectionView.dataSource = self
        
    }
    
    /**
       func that reload collection views after getting data drom backend
      - Parameters :
      - zero parameters
      */
    
    func reloadCollectionViews() {
        
//        featureBrandsCollectionView.reloadData()
//        freeOffersCollectionView.reloadData()
//        paidOffersCollectionView.reloadData()
//        hotOffersCollectionView.reloadData()
//        pannersCollectionView.reloadData()
//     //   startTimer()
//        pannersCollectionView.startAutoScrolling(withTimeInterval: TimeInterval(exactly: 2.0)!)
        
    }
    
    /**
       func that start timer that scroll collection view
      - Parameters :
      - zero parameters
      */
    
//        func startTimer() {
//
//            _ =  Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
//        }
    
    
    //MARK: - IBActions
    
    /**
           this IBAction calls when user tapps search button which opens search bar
           - Parameters:
           - sender : the button that intiate the action.
           */
    
    @objc func searchTapped() {
        
//        let storyboard = UIStoryboard(name: "Home", bundle: nil)
//        let homeSearchVC =  storyboard.instantiateViewController(withIdentifier: "HomeSearchVC") as! HomeSearchVC
//        self.addChild(homeSearchVC)
//        homeSearchVC.view.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview((homeSearchVC.view)!)
//        homeSearchVC.didMove(toParent: self)
//
//            self.view.addConstraints([
//                NSLayoutConstraint(item: homeSearchVC.view!, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0),
//                NSLayoutConstraint(item: homeSearchVC.view!, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0),
//                NSLayoutConstraint(item: homeSearchVC.view!, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0),
//                NSLayoutConstraint(item: homeSearchVC.view!, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
//                ])
        
    }
    
    /**
           this IBAction calls when timer starts  which scroll panners collectionView
           - Parameters:
           - sender : timer
           */
    
//    @objc func scrollAutomatically(_ timer1: Timer) {
//
//        if let coll  = pannersCollectionView {
//
//
//            var cells = coll.visibleCells
//
//            if cells.count < pannersArr.count && pannersArr.count != 0 {
//
//                let indexPath = IndexPath(row: pannersArr.count - 1, section: 0)
//
//                print(indexPath.row)
//
//                cells.append(pannersCollectionView.cellForItem(at: indexPath)!)
//
//            }
//
//
//             for cell in cells {
//                 let indexPath: IndexPath? = coll.indexPath(for: cell)
//                 if ((indexPath?.row)!  < pannersArr.count - 1){
//                     let indexPath1: IndexPath?
//                     indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)
//
//                    coll.scrollToItem(at: indexPath1!, at: .centeredHorizontally, animated: true)
//                 }
//                 else{
//                     let indexPath1: IndexPath?
//                     indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
//                     coll.scrollToItem(at: indexPath1!, at: .left, animated: true)
//                 }
//
//             }
//         }
//    }
    
    /**
           this IBAction calls when user tapps view All Categories button
           - Parameters:
           - sender : the button that intiate the action.
           */
    
    @IBAction func viewAllCategoriesBtnTapped(_ sender: Any) {
        
        let storiBoard = UIStoryboard(name: "Home", bundle: nil)
        let categoriesListVC = storiBoard.instantiateViewController(withIdentifier: "ExploreAllVC") as! ExploreAllVC
        self.navigationController?.pushViewController(categoriesListVC, animated: true)
    }
    
    /**
           this IBAction calls when user tapps view All free offers button
           - Parameters:
           - sender : the button that intiate the action.
           */
    
    @IBAction func ViewAllBestSellingBtnTapped(_ sender: Any) {
        
        let storiBoard = UIStoryboard(name: "Item", bundle: nil)
        let itemsListVC = storiBoard.instantiateViewController(withIdentifier: "ItemsListVC") as! ItemsListVC
      //  paidOffersListVC.type = "free"
        self.navigationController?.pushViewController(itemsListVC, animated: true)
        
    }
    
  

    
    /**
           this IBAction calls when user tapps view All Featured Brands button
           - Parameters:
           - sender : the button that intiate the action.
           */
    
    
    @IBAction func viewAllFeaturedBrands(_ sender: Any) {
        
        let storiBoard = UIStoryboard(name: "Home", bundle: nil)
        let brandsListVC = storiBoard.instantiateViewController(withIdentifier: "BrandsVC") as! BrandsVC
        self.navigationController?.pushViewController(brandsListVC, animated: true)
        
    }
    
    /**
           this IBAction calls when user tapps view All Hot offers button
           - Parameters:
           - sender : the button that intiate the action.
           */
    
    @IBAction func viewAllNewArrivalsTapped(_ sender: Any) {
        
        let storiBoard = UIStoryboard(name: "Item", bundle: nil)
        let itemsListVC = storiBoard.instantiateViewController(withIdentifier: "ItemsListVC") as! ItemsListVC
      //  paidOffersListVC.type = "free"
        self.navigationController?.pushViewController(itemsListVC, animated: true)
    }
    
}

//MARK: - Collection View Delegate

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == pannersCollectionView {
            
            return 3
            
         //   return pannersArr.count
            
        } else if collectionView == exploreCollectionView {
            
            return specificationsArr.count
            
            
        } else if collectionView == bestSellerCollectionView {
            
//            if categories.count < 4 {
//                return categories.count
//
//            } else {
//
//                return 4
//            }
            return 2
            
            
        } else if  collectionView == featuredBrandsCollectionView {
            
      //      return brands.count
            return 4
            
        }  else if collectionView == newArrivalsCollectionView {
            
        //    return freeOffers.count
            return 2
            
        } else {
            
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == pannersCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PannersCollectionViewCell", for: indexPath) as! PannersCollectionViewCell
     //       cell.configureCell(banner: self.pannersArr[indexPath.row])
            
            return cell
            
        } else if collectionView == exploreCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            cell.configureCell(spec: specificationsArr[indexPath.row])
            
            return cell
            
        } else if collectionView == bestSellerCollectionView || collectionView == newArrivalsCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
            
            cell.itemImageView.image = UIImage(named: "item" + "\(indexPath.row + 1)")
//            let opacity:CGFloat = 0.1
//
//            if indexPath.row < 5 {
//
//
//            cell.categoryImageView.backgroundColor = hexStringToUIColor(hex: brandColors[indexPath.row]).withAlphaComponent(opacity)
//
//            } else {
//
//                cell.categoryImageView.backgroundColor = hexStringToUIColor(hex: brandColors[(indexPath.row) - 4]).withAlphaComponent(opacity)
//            }
            
        //    cell.configureCell(category: self.categories[indexPath.row])
            
            return cell
            
        }  else if collectionView == featuredBrandsCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeatureBrandsCollectionViewCell", for: indexPath) as! FeatureBrandsCollectionViewCell
            
            cell.mainView.backgroundColor = hexStringToUIColor(hex: brandColors[indexPath.row])
            cell.brandImageView.image = UIImage(named: "brand" + "\(indexPath.row + 1)")
          //  cell.configureCell(brand: self.brands[indexPath.row], color: brandColors[indexPath.row])
            
            return cell
            
        } else {
            
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if collectionView == pannersCollectionView {
            
            return CGSize(width: collectionView.frame.width - 60, height: collectionView.frame.height)
            
        } else if collectionView == exploreCollectionView {
            
            return CGSize(width: (collectionView.frame.width) / 2.5, height: ((collectionView.frame.width / 2.5) + 33))
            
        } else if collectionView == featuredBrandsCollectionView {
            
            return CGSize(width: ((collectionView.frame.width) / 4) , height: (collectionView.frame.width) / 4)
            
        } else if collectionView == bestSellerCollectionView || collectionView == newArrivalsCollectionView {
            
            return CGSize(width: (collectionView.frame.width) / 2 , height: ((collectionView.frame.width) / 2))
            
        } else {
            
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == exploreCollectionView {
            
            let cell = collectionView.cellForItem(at: indexPath) as! CategoryCollectionViewCell
            
          //  self.selectedCategory = categories[indexPath.row].categoryName
          //  let cell = collectionView.cellForItem(at: indexPath) as! FilterCategoriesCollectionViewCells
            
            let cells = collectionView.visibleCells as! [CategoryCollectionViewCell]
            
            let opacity:CGFloat = 0.8
            let borderColor =  hexStringToUIColor(hex: "#FFFFFF")
            
            
            for cell in cells {
                cell.mainView.backgroundColor = borderColor
            }
            
            cell.mainView.backgroundColor = hexStringToUIColor(hex: "#204BF6").withAlphaComponent(opacity)
            
//                let storyBoard = UIStoryboard(name: "Lists", bundle: nil)
//                let offersListVC = storyBoard.instantiateViewController(withIdentifier: "OffersListVC") as! OffersListVC
//                offersListVC.categoryType = categories[indexPath.row].categoryName
//                self.navigationController?.pushViewController(offersListVC, animated: true)
            
        }  else {
            
                            let storyBoard = UIStoryboard(name: "Item", bundle: nil)
                            let itemDetailsVC = storyBoard.instantiateViewController(withIdentifier: "ItemDetailsVC") as! ItemDetailsVC
                       //     offersListVC.categoryType = categories[indexPath.row].categoryName
                            self.navigationController?.pushViewController(itemDetailsVC, animated: true)
            
            
        }
    }
}


extension HomeVC: HomeDelegate {
    
    func getAllSpecificationsSuccess(success: Bool) {
        
        if success {
            hud.dismiss()
        } else {
            hud.dismiss()
            Toast.show(message: "some error happened, please try again later", controller: self)
        }
    }
    
    func passAllSpecifications(specs: [Specification]) {
        
        self.specificationsArr = specs
        self.exploreCollectionView.reloadData()
    }
    
}


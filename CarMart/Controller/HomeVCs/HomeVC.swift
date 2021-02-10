//
//  HomeVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 25/01/2021.
//

import UIKit
import Gifu
import AutoScrollCollectionView

/// HomeVC

class HomeVC: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var exploreCollectionView: UICollectionView!
    @IBOutlet weak var bestSellerCollectionView: UICollectionView!
    @IBOutlet weak var featuredBrandsCollectionView: UICollectionView!
    @IBOutlet weak var newArrivalsCollectionView: UICollectionView!
    //   @IBOutlet weak var loaderImageView: GIFImageView!
    
    //MARK: - Vars
    
    var mySubview = UIView()
    var loaderGIF = GIFImageView()

    var categories = [CategoryElement]()
    var freeOffers = [OfferModel]()
    var paidOffers = [OfferModel]()
    var hotOffers = [OfferModel]()
    var brands = [Brand]()
    var pannersArr = [String]()
    var categoryIndex = "1"
    
    var brandColors = ["#2BB49D", "#4089E8", "#E95FA4", "#F6C677"]
    
    //MARK: - view life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        localize()
                
        initCollectionViews()
        setUpNavigation()
        
        if Reachable.isConnectedToNetwork() {
            
     //       addLoadingView(mySubview: mySubview, loaderGif: loaderGIF, view: view)
            
      //  getHomeData()
      //  getCategories()
            
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
        
        let fontSize: CGFloat
        
        if self.view.frame.width > 500 {
            fontSize = 27
        } else {
            fontSize = 18
        }
        
        self.navigationController?.navigationBar.backgroundColor = hexStringToUIColor(hex: "#204BF6")
         //   self.navigationItem.title = "Filter".localizableString()
           // self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: hexStringToUIColor(hex: "#282828"),
                 //                                                           NSAttributedString.Key.font: UIFont(name: "Poppins-Regular".localizableString(), size: fontSize)!]
            

        
        navigationController?.navigationBar.clipsToBounds = true
        
        navigationController?.navigationBar.barTintColor = hexStringToUIColor(hex: "#204BF6")
        

        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.navigationBar.backgroundColor = hexStringToUIColor(hex: "#204BF6")
        
        let height: CGFloat = 100 //whatever height you want to add to the existing height
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
        
        let searchBtn = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        searchBtn.image = UIImage(named: "Icon awesome-search".localizableString())
        searchBtn.tintColor = hexStringToUIColor(hex: "#FFFFFF")
        navigationItem.leftBarButtonItem = searchBtn
        
        let cartBtn = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        cartBtn.image = UIImage(named: "Path 27618")
        cartBtn.tintColor = hexStringToUIColor(hex: "#FFFFFF")
        navigationItem.leftBarButtonItem = cartBtn
        
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
        
        let storiBoard = UIStoryboard(name: "Lists", bundle: nil)
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
        
        if collectionView == exploreCollectionView {
            
        //    return pannersArr.count
            return 3
            
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
        
        if collectionView == exploreCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            cell.categoryImageView.image = UIImage(named: "cat" + "\(indexPath.row + 1)")
            
         //   cell.configureCell(banner: self.pannersArr[indexPath.row])
            
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
        
        if collectionView == exploreCollectionView {
            
            return CGSize(width: (collectionView.frame.width) / 2.5, height: collectionView.frame.height - 10)
            
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

//MARK: - APIs

//extension HomeVC {
//
//    /**
//       func that make API call that get Home Data
//      - Parameters :
//      - zero parameters
//      */
//
//    func getHomeData() {
//
//
//        _ = Network.request(req: HomeOffersRequest(), completionHandler: { (result) in
//            switch result {
//
//            case .success(let homeOffers):
//
//                self.brands = homeOffers.featured!
//                self.freeOffers = homeOffers.freeOffers!
//                self.paidOffers = homeOffers.paidOffers!
//                self.hotOffers = homeOffers.populerOffers!
//                self.pannersArr = homeOffers.photos!
//                self.reloadCollectionViews()
//                self.mySubview.isHidden = true
////                self.loaderGif.isHidden = true
////                self.loaderBackGround.isHidden = true
//
//
//            case .cancel(let cancelError):
//                print(cancelError!)
//
////                self.loaderGif.isHidden = true
////                self.loaderBackGround.isHidden = true
//                self.mySubview.isHidden = true
//                Toast.show(message: "someErrorHappened".localizableString(), controller: self)
//
//            case .failure(let error):
//
////                self.loaderGif.isHidden = true
////                self.loaderBackGround.isHidden = true
//                self.mySubview.isHidden = true
//                Toast.show(message: "someErrorHappened".localizableString(), controller: self)
//                print(error!)
//            }
//        })
//    }
//
//    /**
//       func that make API call that get categories
//      - Parameters :
//      - zero parameters
//      */
//
//    func getCategories() {
//
//        _ = Network.request(req: CategoriesRequest(index: "1"), completionHandler: { (result) in
//           switch result {
//           case .success(let response):
//           print(response)
//            self.categories = response.categories!
//            self.categoriesCollectionView.reloadData()
//            self.mySubview.isHidden = true
//            case .cancel(let cancelError):
//            self.mySubview.isHidden = true
//            Toast.show(message: "someErrorHappened".localizableString(), controller: self)
//           print(cancelError!)
//           case .failure(let error):
//            self.mySubview.isHidden = true
//            Toast.show(message: "someErrorHappened".localizableString(), controller: self)
//           print(error!)
//            }
//        })
//    }
//}


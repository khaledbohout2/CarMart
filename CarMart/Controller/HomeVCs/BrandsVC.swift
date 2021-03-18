//
//  BrandsVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 09/02/2021.
//

import UIKit
import CollectionViewPagingLayout
import Gifu

/// Brands  VC

class BrandsVC: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var bannersCollectionView: UICollectionView!
    @IBOutlet weak var BrandsColectionView: UICollectionView!
    @IBOutlet weak var feutureBrandsLbl: UILabel!
    @IBOutlet weak var allBrandsLbl: UILabel!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    //MARK: - Vars
    
    var mySubview = UIView()
    var loaderGIF = GIFImageView()
    
    var scrollTimer: Timer?
    var index = 0
    
    let layout = CollectionViewPagingLayout()
    
    
    var brands = [String]()
    var featuredBrands = [String]()
    var scrollIndex = 0
    
    //MARK: - view life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     //   localize()
        
        initCollectionView()
        
        setUpNavigation()
        
//        if Reachable.isConnectedToNetwork() {
//            
//            addLoadingView(mySubview: mySubview, loaderGif: loaderGIF, view: view)
//            
//      //  getBrands()
//    //    getFeaturedBrands()
//            
//        } else {
//            
//            Toast.show(message: "noInternet".localizableString(), controller: self)
//        }
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        let height = BrandsColectionView.collectionViewLayout.collectionViewContentSize.height
        collectionViewHeight.constant = height
        self.view.layoutIfNeeded()
    }
    
    //MARK: - Methods
    
    /**
       func that init collection view
      - Parameters :
      - zero parameters
      */
    
    func initCollectionView() {
        
        bannersCollectionView.delegate = self
        bannersCollectionView.dataSource = self
        let nib = UINib(nibName: "BannersCollectionViewCell", bundle: nil)
        bannersCollectionView.register(nib, forCellWithReuseIdentifier: "BannersCollectionViewCell")
        
        bannersCollectionView.collectionViewLayout = layout
        bannersCollectionView.isPagingEnabled = true
        
        BrandsColectionView.delegate = self
        BrandsColectionView.dataSource = self
        let brandsNib = UINib(nibName: "BrandsColectionViewCell", bundle: nil)
        BrandsColectionView.register(brandsNib, forCellWithReuseIdentifier: "BrandsColectionViewCell")

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
                self.navigationController?.navigationBar.backgroundColor = hexStringToUIColor(hex: "#204BF6")
        }


        let fontSize: CGFloat

        if self.view.frame.width > 500 {
            fontSize = 27
        } else {
            fontSize = 18
        }
//

            self.navigationItem.title = "notifications".localizableString()
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: hexStringToUIColor(hex: "#FFFFFF"),
                                                                            NSAttributedString.Key.font: UIFont(name: "Poppins-Regular".localizableString(), size: fontSize)!]


        
//        let backBtn = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(backTapped))
//        backBtn.image = UIImage(named: "ArrowLeft".localizableString())
//        backBtn.tintColor = hexStringToUIColor(hex: "#000000")
//        navigationItem.leftBarButtonItem = backBtn
        
    }
    
    /**
       func that make localization for all subviews
      - Parameters :
      - zero parameters
      */
    
    func localize() {

        feutureBrandsLbl.text = "featuredBrands".localizableString()
        feutureBrandsLbl.setLocalization()
        allBrandsLbl.text = "allBrands".localizableString()
        allBrandsLbl.setLocalization()
    }
    
    //MARK: - IBActions
    
    /**
           this IBAction calls when user tappsbackBtn button which pop VC
           - Parameters:
           - sender : the button that intiate the action.
           */
    
    @objc func backTapped() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    /**
           this IBAction calls when user tapps search button which pop VC
           - Parameters:
           - sender : the button that intiate the action.
           */
    
    @objc func searchTapped() {
        
//        let storyboard = UIStoryboard(name: "Home", bundle: nil)
//        let homeSearchVC =  storyboard.instantiateViewController(withIdentifier: "HomeSearchVC") as? HomeSearchVC
//        self.addChild(homeSearchVC!)
//        homeSearchVC?.view.frame = self.view.frame
//        self.view.addSubview((homeSearchVC?.view)!)
//        homeSearchVC?.didMove(toParent: self)
        
    }
    
    /**
           this IBAction calls with timer to  scroll brands slider
           - Parameters:
           - sender : the button that intiate the action.
           */
    
    @objc func runTimedCode() {

        scrollIndex += 1

        if scrollIndex < featuredBrands.count - 1 {
            
            self.layout.goToNextPage()

        } else {
            
         //   self.layout.goToPreviousPage()
        }
        
        if scrollIndex == 3 {
            
            scrollTimer?.invalidate()
        }
    }

    deinit {

        scrollTimer?.invalidate()
    }
    
}

//MARK: - UICollectionView Delegate and data source

extension BrandsVC: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == bannersCollectionView {
            
            return 3
        
     //   return featuredBrands.count
            
        } else {
            
            return 3
          //  return brands.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == bannersCollectionView {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannersCollectionViewCell", for: indexPath) as! BannersCollectionViewCell
            
//        let photoLink = featuredBrands[indexPath.row].bannerPhoto ?? ""
//            print(photoLink)
//                        cell.bannerImageView.sd_setImage(with: URL(string: (SharedSettings.shared.settings?.setting?.bannersLink ?? "") + "/" + photoLink), placeholderImage: UIImage(named: "placeholder"), options: [.fromLoaderOnly])
        
        return cell
            
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandsColectionViewCell", for: indexPath) as! BrandsColectionViewCell
       //     cell.configureCell(brand: brands[indexPath.row])
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == BrandsColectionView {
            
//            let storyBoard = UIStoryboard(name: "Lists", bundle: nil)
//            let paidOffersListVC = storyBoard.instantiateViewController(withIdentifier: "PaidOffersListVC") as! PaidOffersListVC
//            print(brands[indexPath.row].id!)
//            paidOffersListVC.vendorId = "\(brands[indexPath.row].id!)"
//            self.navigationController?.pushViewController(paidOffersListVC, animated: true)
        } else {
            
//            let storyBoard = UIStoryboard(name: "Lists", bundle: nil)
//            let paidOffersListVC = storyBoard.instantiateViewController(withIdentifier: "PaidOffersListVC") as! PaidOffersListVC
//            print(brands[indexPath.row].id!)
//            paidOffersListVC.vendorId = "\(featuredBrands[indexPath.row].id!)"
//            self.navigationController?.pushViewController(paidOffersListVC, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == bannersCollectionView {

            return layout.collectionViewContentSize
        

        } else {

            return CGSize(width: self.BrandsColectionView.frame.width / 2, height: self.BrandsColectionView.frame.width / 2)
        }
    }
    
}

//
//  CategoriesVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 27/01/2021.
//

import UIKit
import JGProgressHUD

class CategoriesVC: UIViewController {
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var userNameLbl: UILabel!
    
    var userName: String!
    var profileImageLink: String!
    
    
    var height = ["tall", "short", "short", "tall"]

  //  var photos = Photo.allPhotos()
    
    var categories = [CategoryElement]()
    
    var mainCategories = [CategoryElement]()
    
    var categoriesPresenter = CategoriesPresenter()
    
    var page = 0
    
    var getNext = false
    
    var hud = JGProgressHUD()
      
      override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
      }
      
      override func viewDidLoad() {
        
        super.viewDidLoad()
        
        initCollectionView()
        
        setUpUI()
        
        getServices()
        
        searchBar.delegate = self
      }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let height = categoriesCollectionView.collectionViewLayout.collectionViewContentSize.height
        collectionViewHeight.constant = height
        self.view.layoutIfNeeded()
    }
    
    func initCollectionView() {
        
        if let layout = categoriesCollectionView?.collectionViewLayout as? PinterestLayout {
            
          layout.delegate = self
        }
        
        if let patternImage = UIImage(named: "Pattern") {
       //   view.backgroundColor = UIColor(patternImage: patternImage)
        }
      //  categoriesCollectionView?.backgroundColor = .clear
        categoriesCollectionView?.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
    }
    
    func setUpUI() {
        
        searchBar.layer.borderColor = searchBar.barTintColor?.cgColor
        
        searchBar.compatibleSearchTextField.backgroundColor  = hexStringToUIColor(hex: "#FFFFFF")
        let imageLink = getUserProfileImage()
        self.profileImageView.sd_setImage(with: URL(string: URLS.userURL + imageLink), placeholderImage: UIImage(named: "placeholder"), options: [.fromLoaderOnly])
        self.userNameLbl.text = "Hello" + getUserName()
    }
    
    func getServices() {
        
        categoriesPresenter.delegate = self
        
        if Reachable.isConnectedToNetwork() {
            
            hud.textLabel.text = "loading"
            hud.show(in: self.view)
            
            let req = GetCategoriesRequest(page: self.page)
            
            self.categoriesPresenter.getCategories(req: req)
            
        } else {
            
            Toast.show(message: "No Internet", controller: self)
        }
    }
    
    //MARK:- IBActions
    
    @IBAction func homeBtnTapped(_ sender: Any) {
        
        
        let storyBaord = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBaord.instantiateViewController(withIdentifier: "HomeTBC") as! HomeTCB
        vc.modalPresentationStyle =  .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    }

    extension CategoriesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return categories.count
      }
      
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnnotatedPhotoCell", for: indexPath as IndexPath) as! AnnotatedPhotoCell
        let category = categories[indexPath.row]
        cell.configureCell(category: category)

        return cell
      }
      
//      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
//        return CGSize(width: itemSize, height: itemSize)
//      }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         //   FastMaintenanceVC
            
            if indexPath.row == 0 {
                
                let storiBoard = UIStoryboard(name: "Home", bundle: nil)
                let maintainingCenteresVC = storiBoard.instantiateViewController(withIdentifier: "WinchListVC") as! WinchListVC
                self.navigationController?.pushViewController(maintainingCenteresVC, animated: true)
                
            } else if indexPath.row == 1 {
                
                let storiBoard = UIStoryboard(name: "Home", bundle: nil)
                let maintainingCenteresVC = storiBoard.instantiateViewController(withIdentifier: "MaintainingCenteresVC") as! MaintainingCenteresVC
                self.navigationController?.pushViewController(maintainingCenteresVC, animated: true)

            } else if indexPath.row == 2 {
                
                let storiBoard = UIStoryboard(name: "Item", bundle: nil)
                let carWashDetailsVc = storiBoard.instantiateViewController(withIdentifier: "CarWashDetailsVc") as! CarWashDetailsVc
                self.navigationController?.pushViewController(carWashDetailsVc, animated: true)
                
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            if indexPath.row == categories.count - 1 || getNext == true {
                
            }
        }
    }

    extension CategoriesVC: PinterestLayoutDelegate {
      func collectionView(
        _ collectionView: UICollectionView,
        heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        
        let cellHeight = height[indexPath.item % 4]
        
        if cellHeight == "tall" {
            
            return (collectionView.frame.width / 2) * 1.4
            
        } else {
            
            return (collectionView.frame.width / 2)
            
        }
      }
    

}

//MARK: - UISearchBar Delegate

extension CategoriesVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        print(searchText.count)
        
        if searchText.count != 0 {
            
            if Reachable.isConnectedToNetwork() {
                
                hud.textLabel.text = "loading"
                hud.show(in: self.view)
                
                let req = SearchCategoriesRequest(value: searchText)
            
                self.categoriesPresenter.searchCategories(req: req)
                
            } else {
                
                Toast.show(message: "No Internet", controller: self)
            }
            
        } else if searchText.count == 0 {
            
        //    self.navigationController?.popViewController(animated: true)
            
            self.categories = mainCategories
            self.categoriesCollectionView.reloadData()
            
            print("no search")
            

            
//                            self.notFoundImage.isHidden = true
//                            self.notFoundLbl.isHidden = true
//                            self.noResultLbl.isHidden = true
            
        }

    }
    
  
}

extension CategoriesVC: CategoriesDelegate {
    
    func getCategoriesSuccess(success: Bool) {
        
        if success {
            
            hud.dismiss()
            
        } else {
            
            hud.dismiss()
            
            Toast.show(message: "sorry, some error happened. please try again later", controller: self)
        }
    }
    
    func passCategories(categories: CategoriesResponse) {
        
        self.page += 1
        
        for category in categories.data {
        
            self.categories.append(category)
            self.mainCategories.append(category)
        }
        self.categoriesCollectionView.reloadData()
        
        if categories.nextPageURL == nil {
            
            getNext = false
            
        } else {
            
            getNext = true
        }
    }
    
    func searchCategoriesSuccess(success: Bool) {
        
        if success {
            
            hud.dismiss()
            
        } else {
            
            hud.dismiss()
            
            Toast.show(message: "sorry, some error happened. please try again later", controller: self)
        }
    }
    
    func passSearchCategories(categories: CategoriesResponse) {
        
        self.categories = categories.data
        self.categoriesCollectionView.reloadData()
        
    }
    
}

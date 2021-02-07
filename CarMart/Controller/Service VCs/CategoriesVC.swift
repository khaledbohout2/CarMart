//
//  CategoriesVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 27/01/2021.
//

import UIKit

class CategoriesVC: UIViewController {
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var height = ["tall", "short", "short", "tall"]

    var photos = Photo.allPhotos()
      
      override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
      }
      
      override func viewDidLoad() {
        
        super.viewDidLoad()
        searchBar.layer.borderColor = searchBar.barTintColor?.cgColor
        
        searchBar.compatibleSearchTextField.backgroundColor  = hexStringToUIColor(hex: "#FFFFFF")
        
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
    
    //MARK:- IBActions
    
    @IBAction func homeBtnTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    }

    extension CategoriesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(photos.count)
        return 8
      }
      
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnnotatedPhotoCell", for: indexPath as IndexPath) as! AnnotatedPhotoCell
        let index = indexPath.row
        if index < 4 {
            
        cell.photo = Photo(caption: "Need Repair", comment: "1200 repair", image: UIImage(named: "ser" + "\(indexPath.row)")!)
            
        } else {
            
            cell.photo = Photo(caption: "Need Repair", comment: "1200 repair", image: UIImage(named: "ser" + "\(indexPath.row / 2)")!)
        }
        return cell
      }
      
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: itemSize, height: itemSize)
      }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         //   FastMaintenanceVC
            
            let storiBoard = UIStoryboard(name: "Home", bundle: nil)
            let fastMaintenanceVC = storiBoard.instantiateViewController(withIdentifier: "FastMaintenanceVC") as! FastMaintenanceVC
            self.navigationController?.pushViewController(fastMaintenanceVC, animated: true)
        }
    }

    extension CategoriesVC: PinterestLayoutDelegate {
      func collectionView(
        _ collectionView: UICollectionView,
        heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        
        let cellHeight = height[indexPath.item % 4]
        
        if cellHeight == "tall" {
            
            return (collectionView.frame.width / 2) * 1.55
            
        } else {
            
            return (collectionView.frame.width / 2) * 1.09
            
        }
      }
    

}
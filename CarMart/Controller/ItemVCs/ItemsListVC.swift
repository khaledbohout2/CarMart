//
//  ItemsListVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 03/02/2021.
//

import UIKit

class ItemsListVC: UIViewController {
    
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    
    
    var height = ["tall", "short", "short", "tall"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let layout = itemsCollectionView?.collectionViewLayout as? PinterestLayout {
            
          layout.delegate = self
        }
        
        if let patternImage = UIImage(named: "Pattern") {
       //   view.backgroundColor = UIColor(patternImage: patternImage)
        }
      //  categoriesCollectionView?.backgroundColor = .clear
        itemsCollectionView?.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
        itemsCollectionView.delegate = self
        itemsCollectionView.dataSource = self

        // Do any additional setup after loading the view.
    }
}

extension ItemsListVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

    return 8
  }
  
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemListCollectionViewCell", for: indexPath as IndexPath) as! ItemListCollectionViewCell
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
}

extension ItemsListVC: PinterestLayoutDelegate {
  func collectionView(
    _ collectionView: UICollectionView,
    heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
    
    let cellHeight = height[indexPath.item % 4]
    
    if cellHeight == "tall" {
        
        return (collectionView.frame.width / 2) * 1.4
        
    } else {
        
        return (collectionView.frame.width / 2) * 1.2
        
    }
  }


}

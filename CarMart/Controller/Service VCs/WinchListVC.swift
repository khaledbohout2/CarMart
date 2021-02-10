//
//  WinchListVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 09/02/2021.
//

import UIKit

class WinchListVC: UIViewController {
    
    @IBOutlet weak var winchesCollectionView: UICollectionView!
    
    var height = ["tall", "short", "short", "tall"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()
        
        self.navigationController?.navigationBar.isHidden = false

        // Do any additional setup after loading the view.
    }
    
    func setUpCollectionView() {
        
        if let layout = winchesCollectionView?.collectionViewLayout as? PinterestLayout {
            
          layout.delegate = self
        }
        
//        if let patternImage = UIImage(named: "Pattern") {
//          view.backgroundColor = UIColor(patternImage: patternImage)
//        }
      //  categoriesCollectionView?.backgroundColor = .clear
        winchesCollectionView?.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
        winchesCollectionView.delegate = self
        winchesCollectionView.dataSource = self
    }
    

}


extension WinchListVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return 8
  }
  
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemListCollectionViewCell", for: indexPath as IndexPath) as! ItemListCollectionViewCell
    
    let index = indexPath.row
    print(index)
    if index < 4 {
        
    cell.photo = Photo(caption: "Hyundai service senter Repair", comment: "6 october", image: UIImage(named: "win" + "\(index)")!)
        
    } else {
        
        cell.photo = Photo(caption: "Need Repair", comment: "1200 repair", image: UIImage(named: "win" + "\(indexPath.row / 2)")!)
    }
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
    return CGSize(width: itemSize, height: itemSize)
  }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storiBoard = UIStoryboard(name: "Item", bundle: nil)
        let winchDetailsVC = storiBoard.instantiateViewController(withIdentifier: "WinchDetailsVC") as! WinchDetailsVC
        self.navigationController?.pushViewController(winchDetailsVC, animated: true)
    }
}

extension WinchListVC: PinterestLayoutDelegate {
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

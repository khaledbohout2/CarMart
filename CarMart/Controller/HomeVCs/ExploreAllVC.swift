//
//  ExploreAllVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 09/02/2021.
//

import UIKit

class ExploreAllVC: UIViewController {
    
    @IBOutlet weak var exploreAllCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpCollectionView()
    }
    
    func setUpCollectionView() {
        
        let categoryNib = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        exploreAllCollectionView.register(categoryNib, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        exploreAllCollectionView.delegate = self
        exploreAllCollectionView.dataSource = self
        
    }
    

}

extension ExploreAllVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.categoryImageView.image = UIImage(named: "cat" + "\(indexPath.row + 1)")
        
     //   cell.configureCell(banner: self.pannersArr[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.frame.width) / 2, height: (collectionView.frame.width) / 2)
    }
    
    
    
}

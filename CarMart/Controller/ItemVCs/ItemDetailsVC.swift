//
//  ItemDetailsVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 04/02/2021.
//

import UIKit

class ItemDetailsVC: UIViewController {
    
    @IBOutlet weak var pannersCollectionView: UICollectionView!
    @IBOutlet weak var pannersPageControl: UIPageControl!
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initCollectionView()

    }
    
    func initCollectionView() {
        
        let itemNib = UINib(nibName: "ItemPannerCollectionViewCell", bundle: nil)
        pannersCollectionView.register(itemNib, forCellWithReuseIdentifier: "ItemPannerCollectionViewCell")
        pannersCollectionView.delegate = self
        pannersCollectionView.dataSource = self
        
        imagesCollectionView.register(itemNib, forCellWithReuseIdentifier: "ItemPannerCollectionViewCell")
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        
    }
    
    
    @IBAction func addToCartBtn(_ sender: Any) {
        
        
    }
    

}

extension ItemDetailsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemPannerCollectionViewCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == pannersCollectionView {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width / 2)
        }
     else {
    
       return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.width / 3)
    }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        pageControl.currentPage = Int(indexPath.row)
    }
    
    
}

//
//  ExploreAllVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 09/02/2021.
//

import UIKit
import JGProgressHUD

class ExploreAllVC: UIViewController {
    
    @IBOutlet weak var exploreAllCollectionView: UICollectionView!
    
    var exploreAllPresenters = ExploreAllPresenters()
    
    var hud = JGProgressHUD()
    
    var specificationsArr = [Specification]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exploreAllPresenters.delegate = self
        // Do any additional setup after loading the view.
        setUpCollectionView()
        
        if Reachable.isConnectedToNetwork() {
            
            hud.textLabel.text = "loading"
            hud.show(in: self.view)
            let req = GetAllSpeceficationsRequest()
            self.exploreAllPresenters.getAllSpecifications(req: req)
        } else {
            Toast.show(message: "No internet", controller: self)
        }
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
        
        return specificationsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.configureCell(spec: specificationsArr[indexPath.row])
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.frame.width - 62) / 2, height: ((collectionView.frame.width - 62) / 2) + 33)
    }
    
    
    
}

extension ExploreAllVC: ExploreAllDelegate {
    
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
        self.exploreAllCollectionView.reloadData()
    }
    
    
    
}

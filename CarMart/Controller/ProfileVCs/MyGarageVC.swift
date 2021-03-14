//
//  MyGarageVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 09/02/2021.
//

import UIKit

class MyGarageVC: UIViewController {
    
    @IBOutlet weak var carsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initCollectionView()
    }
    
    func initCollectionView() {
    
    let pannersNib = UINib(nibName: "PannersCollectionViewCell", bundle: nil)
        carsCollectionView.register(pannersNib, forCellWithReuseIdentifier: "PannersCollectionViewCell")
        carsCollectionView.delegate = self
        carsCollectionView.dataSource = self

    }
    
    @IBAction func addNewCarTapped(_ sender: Any) {
        
        let profileStoryBoard = UIStoryboard(name: "Profile", bundle: nil)
        let addNewCarVC = profileStoryBoard.instantiateViewController(withIdentifier: "AddNewCar")
        self.navigationController?.pushViewController(addNewCarVC, animated: true)
    }
    

}

extension MyGarageVC: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PannersCollectionViewCell", for: indexPath) as! PannersCollectionViewCell
 //       cell.configureCell(banner: self.pannersArr[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}

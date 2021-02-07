//
//  FeatureBrandsCollectionViewCell.swift
//  CarMart
//
//  Created by Khaled Bohout on 02/02/2021.
//

import UIKit

class FeatureBrandsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var brandImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(brand: Brand, color: String) {
        
        self.brandImageView.sd_setImage(with: URL(string: (SharedSettings.shared.settings?.setting?.usersPhotoLink ?? "") + "/" + (brand.photoLink ?? "")), placeholderImage: UIImage(named: "placeholder"), options: [.fromLoaderOnly])
        
        let opacity:CGFloat = 0.15
        brandImageView.backgroundColor = hexStringToUIColor(hex: color).withAlphaComponent(opacity)
        
    }

}

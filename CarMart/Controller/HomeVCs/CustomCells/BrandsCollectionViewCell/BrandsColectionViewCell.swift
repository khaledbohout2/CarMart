//
//  BrandsColectionViewCell.swift
//  GPless
//
//  Created by Khaled Bohout on 11/10/20.
//

import UIKit

class BrandsColectionViewCell: UICollectionViewCell {

    @IBOutlet weak var brandImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(brand: String) {
        let baseUrl = SharedSettings.shared.settings?.setting?.usersPhotoLink ?? ""
//        let imageUrl = brand.photoLink ?? ""
//        let url = URL(string: baseUrl + "/" + imageUrl)
//        self.brandImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"), options: [.fromLoaderOnly])
    }
    
}

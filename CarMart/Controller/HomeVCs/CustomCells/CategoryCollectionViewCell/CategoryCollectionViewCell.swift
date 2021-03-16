//
//  CategoryCollectionViewCell.swift
//  CarMart
//
//  Created by Khaled Bohout on 02/02/2021.
//

import UIKit
import SDWebImage

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var specNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(spec: Specification) {
        
        let imageLink = spec.imageLink
        
        self.categoryImageView.sd_setImage(with: URL(string: URLS.specificationsURL + imageLink), placeholderImage: UIImage(named: "placeholder"), options: [.fromLoaderOnly])
        
        self.specNameLbl.text = spec.title
    }

}

//
//  categoriesCollectionViewCell.swift
//  GPless
//
//  Created by Khaled Bohout on 11/3/20.
//

import UIKit
import SDWebImage

class categoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(category: CategoryElement) {
        
        self.categoryTitleLbl.text = category.title
        self.categoryTitleLbl.setLocalization()
        
        let coloredIconsLink = SharedSettings.shared.settings?.setting?.coloredIconsLink ?? ""
        let photoLink = category.coloredIcon ?? ""
        
        let url = URL(string: coloredIconsLink + "/" + photoLink)
        
        categoryImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"), options: [.fromLoaderOnly])
        
    }

}

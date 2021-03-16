//
//  ServicesCollectionViewCell.swift
//  CarMart
//
//  Created by Khaled Bohout on 31/01/2021.
//

import UIKit
import SDWebImage

class ServicesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var serviceImageView: UIImageView!
    @IBOutlet weak var serviceTitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(category: CategoryElement) {
        
        self.serviceTitleLbl.text = category.title
        self.serviceTitleLbl.setLocalization()
        
        let coloredIconsLink = SharedSettings.shared.settings?.setting?.coloredIconsLink ?? ""
        let photoLink = category.coloredIcon ?? ""
        
        let url = URL(string: coloredIconsLink + "/" + photoLink)
        
        serviceImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"), options: [.fromLoaderOnly])
        
    }

}

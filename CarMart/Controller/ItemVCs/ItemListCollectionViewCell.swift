//
//  CollectionViewCell.swift
//  CarMart
//
//  Created by Khaled Bohout on 03/02/2021.
//

import UIKit

class ItemListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var captionLabel: UILabel!
    @IBOutlet private weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
      super.awakeFromNib()
      containerView.layer.cornerRadius = 10
      containerView.layer.masksToBounds = true
    }
    
//    var photo: Photo? {
//      
//      didSet {
//        if let photo = photo {
//          imageView.image = photo.image
//          captionLabel.text = photo.caption
//          commentLabel.text = photo.comment
//        }
//      }
//    }
  }

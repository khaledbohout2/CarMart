//
//  UITextField.swift
//  GPless
//
//  Created by Khaled Bohout on 01/01/2021.
//

import Foundation
import UIKit

extension UITextField {
    
    func setLocalization() {
        
       // let currentSvreen = Screens.cur //change this to current device
        
        if self.font != nil {

            let fontName = self.font!.fontName

            let fontSize = self.font!.pointSize
        
        let newFont = fontName.localizableString()
            
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.font: UIFont(name: fontName.localizableString(), size: fontSize)])
        
        self.font = UIFont(name: newFont, size: fontSize)
            
        //    self.iconFont
            
        
        } else {
            
            let font = UIFont(name: "Poppins-Regular".localizableString(), size: 14)
            
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.font: font])
        
        self.font = font
            
        }
        

    
  }
}

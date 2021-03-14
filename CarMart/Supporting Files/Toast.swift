//
//  Toast.swift
//  GPless
//
//  Created by Khaled Bohout on 11/24/20.
//

import Foundation
import UIKit

class Toast {
    
    static func show(message: String, controller: UIViewController) {
        
        let toastContainer = UIView(frame: CGRect())
        toastContainer.backgroundColor = hexStringToUIColor(hex: "#1550C0")
        toastContainer.alpha = 0.0
        toastContainer.layer.cornerRadius = 8;
        toastContainer.clipsToBounds  =  true

        let toastLabel = UILabel(frame: CGRect())
        toastLabel.textColor = hexStringToUIColor(hex: "#FFFFFF")
        toastLabel.textAlignment = .center;
        if UIDevice.current.userInterfaceIdiom == .pad {
            
            toastLabel.font = UIFont(name: "Poppins-Medium".localizableString(), size: 27)
        } else {
        toastLabel.font = UIFont(name: "Poppins-Medium".localizableString(), size: 18)
        }
        toastLabel.text = message
        toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 0

        toastContainer.addSubview(toastLabel)
        controller.view.addSubview(toastContainer)

        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastContainer.translatesAutoresizingMaskIntoConstraints = false

        let a1 = NSLayoutConstraint(item: toastLabel, attribute: .leading, relatedBy: .equal, toItem: toastContainer, attribute: .leading, multiplier: 1, constant: 15)
        let a2 = NSLayoutConstraint(item: toastLabel, attribute: .trailing, relatedBy: .equal, toItem: toastContainer, attribute: .trailing, multiplier: 1, constant: -15)
        let a3 = NSLayoutConstraint(item: toastLabel, attribute: .bottom, relatedBy: .equal, toItem: toastContainer, attribute: .bottom, multiplier: 1, constant: -15)
        let a4 = NSLayoutConstraint(item: toastLabel, attribute: .top, relatedBy: .equal, toItem: toastContainer, attribute: .top, multiplier: 1, constant: 15)
        toastContainer.addConstraints([a1, a2, a3, a4])
        
        var c1 = NSLayoutConstraint()
        var c2 = NSLayoutConstraint()
        
        if UIDevice.current.userInterfaceIdiom == .pad {

         c1 = NSLayoutConstraint(item: toastContainer, attribute: .leading, relatedBy: .equal, toItem: controller.view, attribute: .leading, multiplier: 1, constant: 100)
         c2 = NSLayoutConstraint(item: toastContainer, attribute: .trailing, relatedBy: .equal, toItem: controller.view, attribute: .trailing, multiplier: 1, constant: 100)
            
        } else {
            
             c1 = NSLayoutConstraint(item: toastContainer, attribute: .leading, relatedBy: .equal, toItem: controller.view, attribute: .leading, multiplier: 1, constant: 65)
             c2 = NSLayoutConstraint(item: toastContainer, attribute: .trailing, relatedBy: .equal, toItem: controller.view, attribute: .trailing, multiplier: 1, constant: -65)
            
        }
        
        let c3 = NSLayoutConstraint(item: toastContainer, attribute: .top, relatedBy: .equal, toItem: controller.view, attribute: .top, multiplier: 1, constant: 150)
        
        let c4 = NSLayoutConstraint(item: toastContainer, attribute: .centerX, relatedBy: .equal, toItem: controller.view, attribute: .centerX, multiplier: 1, constant: 0)

        
        controller.view.addConstraints([c3, c4, c1, c2])

        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseIn, animations: {
            toastContainer.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 2.5, options: .curveEaseOut, animations: {
                toastContainer.alpha = 0.0
            }, completion: {_ in
                toastContainer.removeFromSuperview()
            })
        })
    }
}

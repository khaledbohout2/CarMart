//
//  HomeTCB.swift
//  CarMart
//
//  Created by Khaled Bohout on 28/02/2021.
//

import UIKit
import BATabBarController

class HomeTCB: UIViewController {
    
    enum DemoTypes {
        
        case BATabBarWithText
        case BATabBarNoText
    }
    
    var  demotype = DemoTypes.BATabBarNoText
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let testController = BATabBarController()
        testController.tabBarBackgroundColor = UIColor.white
   //     testController.tabBarItemStrokeColor = hexStringToUIColor(hex: "#1550C0")
        var tabBarItem, tabBarItem2, tabBarItem3, tabBarItem4 : BATabBarItem
        
        
        switch (self.demotype) {
        case .BATabBarWithText:
            let option1 = NSMutableAttributedString(string: "Feed")
            option1.addAttribute(.foregroundColor, value: UIColor.white, range: NSRange(location: 0, length: option1.length))
            tabBarItem  = BATabBarItem(image: UIImage(named: "icon1_unselected")!, selectedImage: UIImage(named: "icon1_selected")!, title: option1)
            tabBarItem2 = BATabBarItem(image: UIImage(named: "icon2_unselected")!, selectedImage: UIImage(named: "icon2_selected")!, title: option1)
            tabBarItem3 = BATabBarItem(image: UIImage(named: "icon3_unselected")!, selectedImage: UIImage(named: "icon3_selected")!, title: option1)
            tabBarItem4 = BATabBarItem(image: UIImage(named: "Group 67025")!, selectedImage: UIImage(named: "Group 67025")!, title: option1)

        case .BATabBarNoText:
            tabBarItem  = BATabBarItem(image: UIImage(named: "icon1_unselected")!, selectedImage: UIImage(named: "icon1_selected")!)
            tabBarItem2 = BATabBarItem(image: UIImage(named: "icon2_unselected")!, selectedImage: UIImage(named: "icon2_selected")!)
            tabBarItem3 = BATabBarItem(image: UIImage(named: "icon3_unselected")!, selectedImage: UIImage(named: "icon3_selected")!)
            tabBarItem4 = BATabBarItem(image: UIImage(named: "Group 67025")!, selectedImage: UIImage(named: "Group 67025")!)
        }
        

     //   let badge = BATabBarBadge(value:20, badgeColor: .red)
     //   tabBarItem2.badge = badge

        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)

        let homeVC = homeStoryboard.instantiateViewController(withIdentifier: "HomeVC")
        
        let vc1 = UINavigationController(rootViewController: homeVC)
        
        let cartStoryboard = UIStoryboard(name: "MyCart", bundle: nil)

        let cartVC = cartStoryboard.instantiateViewController(withIdentifier: "MyCart")
        
        let vc2 = UINavigationController(rootViewController: cartVC)
        
        
        let locationStoryboard = UIStoryboard(name: "Map", bundle: nil)

        let mapVC = locationStoryboard.instantiateViewController(withIdentifier: "ServicesOnMapVC")
        
        let vc3 = UINavigationController(rootViewController: mapVC)
        
        let ProfileStoryboard = UIStoryboard(name: "Profile", bundle: nil)

        let profileVC = ProfileStoryboard.instantiateViewController(withIdentifier: "ProfileVC")
        
        let vc4 = UINavigationController(rootViewController: profileVC)
        
        testController.delegate = self
        testController.viewControllers = [vc1, vc2, vc3, vc4]
        testController.tabBarItems = [tabBarItem,tabBarItem2,tabBarItem3, tabBarItem4]
        
        
        //OPTIONAL SETTINGS
        
        //initial view controller
//        testController.initialViewController = vc2
        
        //tab bar background color example
        //testController.tabBarBackgroundColor = .black
        
        //tab bar item stroke color example
//        testController.tabBarItemStrokeColor = .blue
        
        //Tab bar line width example
        //testController.tabBarItemLineWidth = 9.0
        
        //Hides the tab bar when true
        //testController.hidesBottomBarWhenPushed = true
        
        
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
            self.view.addSubview(testController.view)
        }
    }
    
}

extension HomeTCB: BATabBarControllerDelegate {
    func tabBarController(_ tabBarController: BATabBarController, didSelect: UIViewController) {
        print("Delegate success!");
    }
}

//
//  ProfileVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 09/02/2021.
//

import UIKit
import SDWebImage

class ProfileVC: UITableViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var profileUserNameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigation()
        updateUI()
    }
    
    /**
       func that set custom appearnce for view's navigation Bar
      - Parameters :
      - zero parameters
      */
    
    func setUpNavigation() {
        
    //    navigationController?.navigationBar.prefersLargeTitles = true

        if #available(iOS 13.0, *) {
            
            let appearance = UINavigationBarAppearance()
            
            appearance.backgroundColor = hexStringToUIColor(hex: "#204BF6")
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
         //   appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            

            navigationController?.navigationBar.tintColor = .white
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            
        } else {
            // Fallback on earlier versions
                self.navigationController?.navigationBar.backgroundColor = hexStringToUIColor(hex: "#F4F6F8")
        }


        let fontSize: CGFloat

        if self.view.frame.width > 500 {
            fontSize = 27
        } else {
            fontSize = 18
        }
//

    //        self.navigationItem.title = "notifications".localizableString()
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: hexStringToUIColor(hex: "#FFFFFF"),
                                                                            NSAttributedString.Key.font: UIFont(name: "Poppins-Regular".localizableString(), size: fontSize)!]
        
        self.title = "My Acount"
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        let back = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(backTapped))
        back.image = UIImage(named: "ArrowLeft".localizableString())
        back.tintColor = hexStringToUIColor(hex: "#FFFFFF")
        navigationItem.leftBarButtonItem = back
        
        let editBtn = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(editTapped))
        editBtn.image = UIImage(named: "pencil".localizableString())
        editBtn.tintColor = hexStringToUIColor(hex: "#FFFFFF")
        navigationItem.rightBarButtonItem = editBtn
        
    }
    
    func updateUI() {
            
        self.profileUserNameLbl.text = getUserName()
        
        if getUserProfileImage() == "" {
            
            self.profileImageView.image = UIImage(named: "avater")
            
        } else {
            
            let imageName = getUserProfileImage()
            self.profileImageView.sd_setImage(with: URL(string: URLS.userURL + imageName), placeholderImage: UIImage(named: "placeholder"), options: [.fromLoaderOnly])
        }
        
    }
    
    /**
           this IBAction calls when user tapps back button which pop view controller
           - Parameters:
           - sender : the button that intiate the action.
           */
    
    @objc func backTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func editTapped() {
        
        let storyBoard = UIStoryboard(name: "Profile", bundle: nil)
        let editProfileVC = storyBoard.instantiateViewController(withIdentifier: "EditProfileVC")
        self.navigationController?.pushViewController(editProfileVC, animated: true)
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            
            if indexPath.row == 0 {
                
                let storiBoard = UIStoryboard(name: "Profile", bundle: nil)
                let myGarageVC = storiBoard.instantiateViewController(withIdentifier: "MyGarageVC") as! MyGarageVC
                self.navigationController?.pushViewController(myGarageVC, animated: true)
                
            } else if indexPath.row == 1 {
                
                let storiBoard = UIStoryboard(name: "Profile", bundle: nil)
                let myServicesVC = storiBoard.instantiateViewController(withIdentifier: "MyServicesVC") as! MyServicesVC
                self.navigationController?.pushViewController(myServicesVC, animated: true)
                
            } else if indexPath.row == 2 {
                
                let storiBoard = UIStoryboard(name: "Profile", bundle: nil)
                let categoriesListVC = storiBoard.instantiateViewController(withIdentifier: "NotificationsVC")
                self.navigationController?.pushViewController(categoriesListVC, animated: true)
                
            } else if indexPath.row == 3 {
                
                let storiBoard = UIStoryboard(name: "Profile", bundle: nil)
                let myBillsVC = storiBoard.instantiateViewController(withIdentifier: "MyBillsVC") as! MyBillsVC
                self.navigationController?.pushViewController(myBillsVC, animated: true)
                
            } else if indexPath.row == 4 {
                
                let storiBoard = UIStoryboard(name: "Profile", bundle: nil)
                let favouriteVC = storiBoard.instantiateViewController(withIdentifier: "FavouriteVC") as! FavouriteVC
                self.navigationController?.pushViewController(favouriteVC, animated: true)
                
            }
            
        } else {
            
            if indexPath.row == 0 {
                
                let storiBoard = UIStoryboard(name: "Profile", bundle: nil)
                let contactUsVC = storiBoard.instantiateViewController(withIdentifier: "ContactUsVC") as! ContactUsVC
                self.navigationController?.pushViewController(contactUsVC, animated: true)
                
            } else if indexPath.row == 1 {
                
                let storiBoard = UIStoryboard(name: "Profile", bundle: nil)
                let settingsVC = storiBoard.instantiateViewController(withIdentifier: "SettingVC") 
                self.navigationController?.pushViewController(settingsVC, animated: true)
                
            } else if indexPath.row == 2 {
                
                let storiBoard = UIStoryboard(name: "Profile", bundle: nil)
                let logOutVC = storiBoard.instantiateViewController(withIdentifier: "LogOutVC") as! LogOutVC
                self.addChild(logOutVC)
                logOutVC.view.frame = self.view.frame
                self.view.addSubview((logOutVC.view)!)
                logOutVC.didMove(toParent: self)
                
            }
        }
    }



}

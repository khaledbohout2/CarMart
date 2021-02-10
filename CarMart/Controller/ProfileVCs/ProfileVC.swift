//
//  ProfileVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 09/02/2021.
//

import UIKit

class ProfileVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


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
                let categoriesListVC = storiBoard.instantiateViewController(withIdentifier: "Notifications")
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
                let settingsVC = storiBoard.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
                self.navigationController?.pushViewController(settingsVC, animated: true)
                
            } else if indexPath.row == 2 {
                
                let storiBoard = UIStoryboard(name: "Profile", bundle: nil)
                let logOutVC = storiBoard.instantiateViewController(withIdentifier: "LogOutVC") as! LogOutVC
                self.navigationController?.pushViewController(logOutVC, animated: true)
                
            }
        }
    }



}

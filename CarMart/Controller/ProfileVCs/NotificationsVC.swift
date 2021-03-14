//
//  NotificationsVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 10/02/2021.
//

import UIKit

class NotificationsVC: UIViewController {
    
    @IBOutlet weak var notificationsTableView: UITableView!
    
    //MARK: - Vars
    
   // var notificationsArr = [NotificationModel]()
    var index = 1
    var noOfPages: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigation()
        setUpTableView()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Methods
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
                self.navigationController?.navigationBar.backgroundColor = hexStringToUIColor(hex: "#204BF6")
        }


        let fontSize: CGFloat

        if self.view.frame.width > 500 {
            fontSize = 27
        } else {
            fontSize = 18
        }
//

            self.navigationItem.title = "notifications".localizableString()
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: hexStringToUIColor(hex: "#FFFFFF"),
                                                                            NSAttributedString.Key.font: UIFont(name: "Poppins-Regular".localizableString(), size: fontSize)!]


        
//        let backBtn = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(backTapped))
//        backBtn.image = UIImage(named: "ArrowLeft".localizableString())
//        backBtn.tintColor = hexStringToUIColor(hex: "#000000")
//        navigationItem.leftBarButtonItem = backBtn
        
    }
    
    /**
       func that set initiate tableview and register custom cell
      - Parameters :
      - zero parameters
      */

    
    func setUpTableView() {
        
        notificationsTableView.delegate = self
        notificationsTableView.dataSource = self
        
        let nib = UINib(nibName: "NotificationTableViewCell", bundle: nil)
        let imageNib = UINib(nibName: "ImageNotificationTableViewCell", bundle: nil)
        notificationsTableView.register(nib, forCellReuseIdentifier: "NotificationTableViewCell")
        notificationsTableView.register(imageNib, forCellReuseIdentifier: "ImageNotificationTableViewCell")
        
    }
    
    //MARK: - IBActions
    
    /**
           this IBAction calls when user tapps search button which opens search bar
           - Parameters:
           - sender : the button that intiate the action.
           */
    
    @objc func searchTapped() {
        
//        let storyboard = UIStoryboard(name: "Home", bundle: nil)
//        let homeSearchVC =  storyboard.instantiateViewController(withIdentifier: "HomeSearchVC") as? HomeSearchVC
//        self.addChild(homeSearchVC!)
//        homeSearchVC?.view.frame = self.view.frame
//        self.view.addSubview((homeSearchVC?.view)!)
//        homeSearchVC?.didMove(toParent: self)
        
    }
    


}

extension NotificationsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    //    print(notificationsArr.count)
        
      //  return notificationsArr.count
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     //   let notif = notificationsArr[indexPath.row]
        
//        if notif.type == "ads" {
//
//            let cell = notificationsTableView.dequeueReusableCell(withIdentifier: "ImageNotificationTableViewCell", for: indexPath) as! ImageNotificationTableViewCell
//
//            let notifLink = SharedSettings.shared.settings?.setting?.notificationsLink ?? ""
//            let imageLink = notif.imageLink ?? ""
//
//            let url = URL(string: notifLink + "/" + imageLink)
//
//            cell.notificationImageView?.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"), options: [.fromLoaderOnly])
//            return cell
//
//        } else {
        
        let cell = notificationsTableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell
           // cell.configureCell(notification: notif)
        return cell
            
      //  }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return tableView.frame.width / 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//                let storyBoard = UIStoryboard(name: "Offer", bundle: nil)
//                let offerDetailsVC = storyBoard.instantiateViewController(withIdentifier: "OfferDetailsVC") as! OfferDetailsVC
//
//                offerDetailsVC.id = "\(notificationsArr[indexPath.row].id!)"
//                self.navigationController?.pushViewController(offerDetailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
//        if indexPath.row == self.notificationsArr.count - 1 {
//            if index < noOfPages! + 1 {
//            index += 1
//        //    getNotification()
//            }
//        }
    }
    
    
}


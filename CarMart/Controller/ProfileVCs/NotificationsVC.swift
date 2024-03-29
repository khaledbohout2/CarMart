//
//  NotificationsVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 10/02/2021.
//

import UIKit
import JGProgressHUD

class NotificationsVC: UIViewController {
    
    @IBOutlet weak var notificationsTableView: UITableView!
    
    let notificationsPresenter = NotificationsPresenter()
    
    var hud = JGProgressHUD(style: .extraLight)
    
    var notificationsArr = [NotificationModel]()
    
    var getNext = false
    
    var page = 0
    
    //MARK: - Vars
    
   // var notificationsArr = [NotificationModel]()
    var index = 1
    var noOfPages: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigation()
        setUpTableView()
        notificationsPresenter.delegate = self
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
        
        self.title = "Notifications"
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        let back = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(backTapped))
        back.image = UIImage(named: "ArrowLeft".localizableString())
        back.tintColor = hexStringToUIColor(hex: "#FFFFFF")
        navigationItem.leftBarButtonItem = back
        
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
    
    func getNotifications() {
        
        
        
        if Reachable.isConnectedToNetwork() {
            
            hud.textLabel.text = "loading"
            hud.show(in: self.view)
            
            self.notificationsPresenter.getNotifications(req: GetUserNotificationsRequest())
            
        } else {
            
            hud.dismiss()
            Toast.show(message: "No Internet", controller: self)
        }
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
    
    /**
           this IBAction calls when user tapps back button which pop view controller
           - Parameters:
           - sender : the button that intiate the action.
           */
    
    @objc func backTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    


}

extension NotificationsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return notificationsArr.count
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
        let notif = notificationsArr[indexPath.row]
            cell.configureCell(notification: notif)
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
        
        if indexPath.row == self.notificationsArr.count - 1 {
            if getNext {
            
                getNotifications()
            }
        }
    }
    
    
}

extension NotificationsVC: NotificationsDelegate {
    
    func getnotificationsSuccess(success: Bool) {
        if success {
            
            hud.dismiss()
            
        } else {
            
            hud.dismiss()
            
            Toast.show(message: "some error happened, please try again later", controller: self)
        }
    }
    
    func passUserNotificatios(notification: NotificationsResponse) {
        
        self.notificationsArr = notification.notifications
        self.notificationsTableView.reloadData()
        if notification.nextPageURL != nil {
            
            page += 1
            getNext = true
            
        } else {
            
            getNext = false
        }
        
    }
    
    
}


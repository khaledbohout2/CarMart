//
//  MyGarageVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 03/02/2021.
//

import UIKit

class MyGarageVC: UIViewController {

    @IBOutlet weak var myServicesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initTableView()
        self.navigationController?.navigationBar.isHidden = false
        // Do any additional setup after loading the view.
    }
    
    func initTableView() {
        
        myServicesTableView.delegate = self
        myServicesTableView.dataSource = self
        
        let myServiceNib = UINib(nibName: "MyServicesTableViewCell", bundle: nil)
        myServicesTableView.register(myServiceNib, forCellReuseIdentifier: "MyServicesTableViewCell")
        
    }
    


}

extension MyGarageVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Ongoing Service"
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let label = UILabel()
        
        label.textColor = hexStringToUIColor(hex: "#000000")
        
        label.text = "    Ongoing Service"
        
        label.font = UIFont(name: "Segoe UI-Regular", size: 12)
        
        label.backgroundColor = hexStringToUIColor(hex: "#F8F8F8")

        return label

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = tableView.indexPathsForVisibleRows?.first?.section
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyServicesTableViewCell", for: indexPath) as! MyServicesTableViewCell
      //  cell.delegate = self
      //  let offer = offersHistory[index!].offers![indexPath.row]
      //  cell.configureCell(offer: offer)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.width / 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let storyBoard = UIStoryboard(name: "Offer", bundle: nil)
//        let offerDetailsVC = storyBoard.instantiateViewController(withIdentifier: "OfferDetailsVC") as! OfferDetailsVC
//        let index = tableView.indexPathsForVisibleRows?.first?.section
//        offerDetailsVC.id = "\(offersHistory[index!].offers![indexPath.row].id!)"
//        self.navigationController?.pushViewController(offerDetailsVC, animated: true)

    }
    
}

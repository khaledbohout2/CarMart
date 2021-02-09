//
//  MaintainingCenterVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 09/02/2021.
//

import UIKit
import DateTimePicker

class MaintainingCenterVC: UIViewController {
    
    @IBOutlet weak var servicesCollectionView: UICollectionView!
    
    @IBOutlet weak var maintainingCenterView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()
        
        initAdGesture()

        // Do any additional setup after loading the view.
    }
    
    func setUpCollectionView() {
        
        let nib = UINib(nibName: "CenterServicesCollectionViewCell", bundle: nil)
        
        servicesCollectionView.register(nib, forCellWithReuseIdentifier: "CenterServicesCollectionViewCell")
        
        servicesCollectionView.delegate = self
        servicesCollectionView.dataSource = self
        
        
    }
    
    func initAdGesture() {
        
        let adGesture = UITapGestureRecognizer(target: self, action: #selector(self.adViewTapped))
        
        maintainingCenterView.addGestureRecognizer(adGesture)
    }
    
    @objc func adViewTapped() {
        
        let storiBoard = UIStoryboard(name: "Item", bundle: nil)
        let maintainingCentreOfferVC = storiBoard.instantiateViewController(withIdentifier: "MaintainingCentreOfferVC") as! MaintainingCentreOfferVC
        self.navigationController?.pushViewController(maintainingCentreOfferVC, animated: true)
        
        
    }
    
    @IBAction func datePicketBtnTapped(_ sender: Any) {
        
        let min = Date().addingTimeInterval(-60 * 60 * 24 * 4)
        let max = Date().addingTimeInterval(60 * 60 * 24 * 4)
        let picker = DateTimePicker.create(minimumDate: min, maximumDate: max)
        
        // customize your picker
//        picker.timeInterval = DateTimePicker.MinuteInterval.thirty
//        picker.locale = Locale(identifier: "en_GB")

//        picker.todayButtonTitle = "Today"
//        picker.is12HourFormat = true
        picker.dateFormat = "hh:mm:ss aa dd/MM/YYYY"
        picker.includesMonth = true
        picker.includesSecond = true
        picker.highlightColor = hexStringToUIColor(hex: "#1550C0")
        picker.doneButtonTitle = "!! DONE DONE !!"
        picker.doneBackgroundColor = hexStringToUIColor(hex: "#1550C0")
        picker.customFontSetting = DateTimePicker.CustomFontSetting(selectedDateLabelFont: .boldSystemFont(ofSize: 20))
//        if #available(iOS 13.0, *) {
//            picker.normalColor = UIColor.secondarySystemGroupedBackground
//            picker.darkColor = UIColor.label
//            picker.contentViewBackgroundColor = UIColor.systemBackground
//            picker.daysBackgroundColor = UIColor.groupTableViewBackground
//            picker.titleBackgroundColor = UIColor.secondarySystemGroupedBackground
//        } else {
//            picker.normalColor = UIColor.white
//            picker.darkColor = UIColor.black
//            picker.contentViewBackgroundColor = UIColor.white
//        }
        picker.completionHandler = { date in
            let formatter = DateFormatter()
            formatter.dateFormat = "hh:mm:ss aa dd/MM/YYYY"
            self.title = formatter.string(from: date)
        }
        picker.delegate = self
        
        // add picker to your view
        // don't try to make customize width and height of the picker,
        // you'll end up with corrupted looking UI
//        picker.frame = CGRect(x: 0, y: 100, width: picker.frame.size.width, height: picker.frame.size.height)
        // set a dismissHandler if necessary
//        picker.dismissHandler = {
//            picker.removeFromSuperview()
//        }
//        self.view.addSubview(picker)
        
        // or show it like a modal
        picker.show()
    }
    


}

extension MaintainingCenterVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CenterServicesCollectionViewCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
    
    
}

extension MaintainingCenterVC: DateTimePickerDelegate {
    
    func dateTimePicker(_ picker: DateTimePicker, didSelectDate: Date) {
        title = picker.selectedDateString
    }
}

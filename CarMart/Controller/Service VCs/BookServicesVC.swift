//
//  BookServicesVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 04/02/2021.
//

import UIKit
import DateTimePicker

class BookServicesVC: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.3)
        mainView.backgroundColor = UIColor(white: 1, alpha: 1.0)

        // Do any additional setup after loading the view.
    }
    

    @IBAction func openDatePickerBtnTapped(_ sender: Any) {
        
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

extension BookServicesVC: DateTimePickerDelegate {
    
    func dateTimePicker(_ picker: DateTimePicker, didSelectDate: Date) {
        title = picker.selectedDateString
    }
}

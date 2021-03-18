//
//  EnterVerificationCodeVC.swift
//  CarMart
//
//  Created by Khaled Bohout on 18/03/2021.
//

import UIKit

class EnterVerificationCodeVC: UIViewController {
    
    @IBOutlet weak var firstDigitTxtField: UITextField!
    @IBOutlet weak var secondDigitTxtField: UITextField!
    @IBOutlet weak var thirdDigitTxtField: UITextField!
    @IBOutlet weak var forthDigitTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func enterBtnTapped(_ sender: Any) {
        
        guard firstDigitTxtField.text != "" && secondDigitTxtField.text != "" && thirdDigitTxtField.text != "" && forthDigitTxtField.text != ""
        else {
            
            Toast.show(message: "please enter code", controller: self)
            return
        }
        
        let storyBoard = UIStoryboard(name: "EnterNewPassVC", bundle: nil)
        let enterNewPassVC = storyBoard.instantiateViewController(withIdentifier: "EnterNewPassVC") as! EnterNewPassVC
        self.navigationController?.pushViewController(enterNewPassVC, animated: true)
        
    }
}

extension EnterVerificationCodeVC: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if !(string == "") {
            textField.text = string
            if textField == firstDigitTxtField {
                secondDigitTxtField.becomeFirstResponder()
            }
            else if textField == secondDigitTxtField {
                thirdDigitTxtField.becomeFirstResponder()
            }
            else if textField == thirdDigitTxtField {
                forthDigitTxtField.becomeFirstResponder()
            }
            else {
                textField.resignFirstResponder()
            }
            return false
        }
        return true
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if (textField.text?.count ?? 0) > 0 {

        }
        return true
    }
}

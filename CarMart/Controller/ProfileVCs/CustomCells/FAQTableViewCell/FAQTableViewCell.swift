//
//  FAQTableViewCell.swift
//  GPless
//
//  Created by Khaled Bohout on 11/16/20.
//

import UIKit

/// FAQ Table View Cell

class FAQTableViewCell: UITableViewCell {
     
    //MARK: - IBOutlets
    
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var answerLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(question: FAQ) {
        
        questionLbl.text = question.key
        let answers = question.value!
        answerLbl.text = answers.map { "- \($0)" }.joined(separator:"\n")
        
    }
    
}

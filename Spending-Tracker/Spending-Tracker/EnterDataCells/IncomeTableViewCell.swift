//
//  IncomeTableViewCell.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 05/05/1443 AH.
//

import UIKit

class IncomeTableViewCell: UITableViewCell {

    static let identifier = "IncomeTableViewCell"
    
    private let labal : UILabel = {
       let labal = UILabel()
        
        
        
        return labal
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

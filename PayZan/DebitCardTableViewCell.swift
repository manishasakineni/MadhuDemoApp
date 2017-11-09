//
//  DebitCardTableViewCell.swift
//  PayZanScrollViewScreens
//
//  Created by MANOJ KUMAR on 12/10/17.
//  Copyright © 2017 MANOJ KUMAR. All rights reserved.
//

import UIKit

class DebitCardTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet var debitCardDetailsView: UIView!
    
    @IBOutlet var cardNumberTxtField: UITextField!
    
    
    @IBOutlet var monthTxtField: UITextField!
    
    @IBOutlet var yearTxtField: UITextField!
    
    
    @IBOutlet var cardHoldersTxtField: UITextField!
    
    @IBOutlet var cardLabelTxtField: UITextField!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        borderColor1()
        
        
        // Initialization code
    }
    
    func borderColor1(){
        
        debitCardDetailsView.layer.borderWidth = 2
        
        debitCardDetailsView.layer.borderColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0).cgColor
        
        cardNumberTxtField.layer.borderColor = UIColor(red:211.0/255.0, green:211.0/255.0, blue:211.0/255.0, alpha: 1.0).cgColor

        monthTxtField.layer.borderColor = UIColor(red:211.0/255.0, green:211.0/255.0, blue:211.0/255.0, alpha: 1.0).cgColor
        
        yearTxtField.layer.borderColor = UIColor(red:211.0/255.0, green:211.0/255.0, blue:211.0/255.0, alpha: 1.0).cgColor
        
        cardHoldersTxtField.layer.borderColor = UIColor(red:211.0/255.0, green:211.0/255.0, blue:211.0/255.0, alpha: 1.0).cgColor
        
        cardLabelTxtField.layer.borderColor = UIColor(red:211.0/255.0, green:211.0/255.0, blue:211.0/255.0, alpha: 1.0).cgColor


        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

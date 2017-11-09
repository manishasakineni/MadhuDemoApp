//
//  CreditCardTableViewCell.swift
//  PayZanScrollViewScreens
//
//  Created by MANOJ KUMAR on 12/10/17.
//  Copyright © 2017 MANOJ KUMAR. All rights reserved.
//

import UIKit

class CreditCardTableViewCell: UITableViewCell {
    
    
    @IBOutlet var creditCardDetailsView: UIView!
    
    
    @IBOutlet var cardNumberTextField: UITextField!
    
    
    @IBOutlet var monthTextField: UITextField!
    
    @IBOutlet var yearTextField: UITextField!
    
    
    @IBOutlet var cardHoldersTextField: UITextField!
    
    
    @IBOutlet var cardLabelTextField: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        borderColor()
        
        
        // Initialization code
    }
    
    func borderColor(){
        
        creditCardDetailsView.layer.borderWidth = 2
        creditCardDetailsView.layer.borderColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0).cgColor
        
        
        cardNumberTextField.layer.borderColor = UIColor(red:211.0/255.0, green:211.0/255.0, blue:211.0/255.0, alpha: 1.0).cgColor
        
        
        monthTextField.layer.borderColor = UIColor(red:211.0/255.0, green:211.0/255.0, blue:211.0/255.0, alpha: 1.0).cgColor
        

        yearTextField.layer.borderColor = UIColor(red:211.0/255.0, green:211.0/255.0, blue:211.0/255.0, alpha: 1.0).cgColor
        
        cardHoldersTextField.layer.borderColor = UIColor(red:211.0/255.0, green:211.0/255.0, blue:211.0/255.0, alpha: 1.0).cgColor
        
        cardLabelTextField.layer.borderColor = UIColor(red:211.0/255.0, green:211.0/255.0, blue:211.0/255.0, alpha: 1.0).cgColor
        


        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  NetBankingTableViewCell.swift
//  PayZanScrollViewScreens
//
//  Created by MANOJ KUMAR on 12/10/17.
//  Copyright © 2017 MANOJ KUMAR. All rights reserved.
//

import UIKit

class NetBankingTableViewCell: UITableViewCell {
    
    
    @IBOutlet var netBankingDetailsView: UIView!
    
    
    @IBOutlet var selectBankTextField: UITextField!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        borderColor()
        
        
        // Initialization code
    }
    
    func borderColor(){
        
        netBankingDetailsView.layer.borderWidth = 2
        
        netBankingDetailsView.layer.borderColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0).cgColor
        
        
        selectBankTextField.layer.borderColor = UIColor(red:211.0/255.0, green:211.0/255.0, blue:211.0/255.0, alpha: 1.0).cgColor

        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

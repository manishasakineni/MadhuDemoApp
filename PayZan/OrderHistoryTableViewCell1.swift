//
//  OrderHistoryTableViewCell1.swift
//  NewScreens
//
//  Created by Manoj on 22/11/17.
//  Copyright © 2017 Manoj. All rights reserved.
//

import UIKit

class OrderHistoryTableViewCell1: UITableViewCell {
    
    @IBOutlet weak var orderView: UIView!
    
    @IBOutlet weak var repeatBtnOutLet: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        borderColor()

        // Initialization code
    }
    
    func borderColor(){
        
        orderView.layer.borderWidth = 1
        orderView.layer.borderColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0).cgColor
        
        
        repeatBtnOutLet.layer.cornerRadius = 5

        
        
    }
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

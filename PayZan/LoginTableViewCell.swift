//
//  LoginTableViewCell.swift
//  PageView_Naveen
//
//  Created by Nani Mac on 23/09/17.
//  Copyright © 2017 Naveen. All rights reserved.
//

import UIKit

class LoginTableViewCell: UITableViewCell {
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var newAccountBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

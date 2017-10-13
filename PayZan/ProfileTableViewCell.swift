//
//  ProfileTableViewCell.swift
//  PageView_Naveen
//
//  Created by Nani Mac on 22/09/17.
//  Copyright © 2017 Naveen. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var userNameTF: UITextField!
    
    @IBOutlet weak var editProfileBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        userNameTF.text = "Naveen Chatla"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

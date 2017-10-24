//
//  ProfileTableViewCell.swift
//  PageView_Naveen
//
//  Created by Nani Mac on 22/09/17.
//  Copyright © 2017 Naveen. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var emaiLabel: UILabel!
    
    @IBOutlet weak var addWalletLabel: UILabel!
        
    @IBOutlet weak var addMoneyBtn: UIButton!
    
    @IBOutlet weak var editBtn: UIButton!
    
    @IBOutlet weak var editImage: UIImageView!
    
    @IBOutlet weak var editProfileBtn: UIButton!
    
    @IBOutlet weak var profileView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        userNameLabel.text = "Naveen Chatla"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  MenuTableViewCell.swift
//  sideMenu
//
//  Created by MANOJ KUMAR on 21/09/17.
//  Copyright © 2017 MANOJ KUMAR. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    
    @IBOutlet var menuName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

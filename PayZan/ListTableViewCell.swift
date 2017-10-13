//
//  ListTableViewCell.swift
//  PageView_Naveen
//
//  Created by Nani Mac on 22/09/17.
//  Copyright © 2017 Naveen. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var ImgeVw: UIImageView!
    
    
    @IBOutlet weak var textLbl: UILabel!
    
    
    override func awakeFromNib() {
        
       
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

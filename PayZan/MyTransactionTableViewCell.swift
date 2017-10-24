//
//  MyTransactionTableViewCell.swift
//  PayZan
//
//  Created by CalibrageMac02 on 23/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class MyTransactionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var addMoneyLabel: UILabel!
    
    @IBOutlet weak var fromLabel: UILabel!

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var imageVw: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

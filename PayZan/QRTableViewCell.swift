//
//  QRTableViewCell.swift
//  PayZan
//
//  Created by CalibrageMac02 on 13/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class QRTableViewCell: UITableViewCell {
    
    @IBOutlet weak var scanQRBtn: UIButton!
    
    @IBOutlet weak var shareBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  CableTvViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 13/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class CableTvViewController: UIViewController {

    
    @IBOutlet weak var operatorField: UITextField!
    
    @IBOutlet weak var accountNumField: UITextField!
    
    @IBOutlet weak var amountField: UITextField!
    
    @IBOutlet weak var payNowBtn: UIButton!
    
    @IBOutlet weak var offersView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        payNowBtn.backgroundColor = hexStringToUIColor(hex: "#5f1a58")
//        
//        payNowBtn.backgroundColor = hexStringToUIColor(hex: "#8d2029")
//        
//        payNowBtn.layer.cornerRadius = 5
        
        accountNumField.keyboardType = .numberPad
        amountField.keyboardType = .numberPad

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func searchAction(_ sender: Any) {
    }
    
    @IBAction func notificationAction(_ sender: Any) {
    }

}

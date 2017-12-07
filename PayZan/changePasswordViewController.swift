//
//  changePasswordViewController.swift
//  PayZan
//
//  Created by Manoj on 05/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class changePasswordViewController: UIViewController {

    @IBOutlet weak var eyebtnOutLet: UIButton!
    
    @IBOutlet weak var currentPswdTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backAction(_ sender: Any) {
        
         self.navigationController?.popViewController(animated: true)
    }

   
    @IBAction func eyebtnclicked(_ sender: Any) {
        
        if eyebtnOutLet.tag == 0
        {
            currentPswdTF.isSecureTextEntry = false
            eyebtnOutLet.tag = 1
        }
            
        else
            
        {
            currentPswdTF.isSecureTextEntry = true
            eyebtnOutLet.tag = 0
            
            
        }

        
    }

}

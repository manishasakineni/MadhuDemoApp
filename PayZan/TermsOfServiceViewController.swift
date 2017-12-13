//
//  TermsOfServiceViewController.swift
//  PayZan
//
//  Created by Manoj on 05/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class TermsOfServiceViewController: UIViewController {

    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            headerImgHeight.constant = 150
        }
        else {
            
            headerImgHeight.constant = 79
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backAction(_ sender: Any) {
        
         self.navigationController?.popViewController(animated: true)
    }

   
}

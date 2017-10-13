//
//  BaseViewController.swift
//  eSahai
//
//  Created by eSahai on 04/07/17.
//  Copyright © 2017 MiMiTech. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var appDelegate = AppDelegate()
    let sharedController = ServiceController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate = UIApplication.shared.delegate as! AppDelegate

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
    extension BaseViewController{
        
      
    }



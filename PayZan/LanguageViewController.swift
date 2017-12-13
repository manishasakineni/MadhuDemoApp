//
//  LanguageViewController.swift
//  PayZan
//
//  Created by N@n!'$ Mac on 11/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
import AVFoundation

class LanguageViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {
    
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            headerImgHeight.constant = 150
        }
        else {
            
            headerImgHeight.constant = 79
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    
    @IBAction func english(_ sender: Any) {
        
       self.changeToLanguage("en")
        
    }
    
    
    
    @IBAction func telugu(_ sender: Any) {
        
        self.changeToLanguage("te")
    }
    
    
    @IBAction func sinhala(_ sender: Any) {
        
        self.changeToLanguage("si")
    }
    
    
    @IBAction func Tamil(_ sender: Any) {
        
        self.changeToLanguage("ta")
    }

    private  func changeToLanguage(_ langCode : String) {
        
        if Bundle.main.preferredLocalizations.first != langCode{
            
            
            let alertController = UIAlertController(title: "restartTitle", message:
                "Good Morning Everyone!", preferredStyle: UIAlertControllerStyle.alert)
            
            //   alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default))
            
            
            alertController.title = NSLocalizedString("restartTitle", comment: "")
            alertController.message = NSLocalizedString("restart", comment: "")
            
            let confirmation  = UIAlertAction(title : NSLocalizedString("OK", comment: ""), style: .default){   _ in
                
                UserDefaults.standard.set([langCode], forKey: "AppleLanguages")
                UserDefaults.standard.synchronize()
                  exit(EXIT_SUCCESS)
                
                
                
            }
            
            alertController.addAction(confirmation)
            
            let cancelAction = UIAlertAction(title : NSLocalizedString("Cancel", comment: ""), style: .cancel , handler : nil)
            
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true, completion: nil)
            
            
            
            
        }
        
        
    }
    
    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }

}

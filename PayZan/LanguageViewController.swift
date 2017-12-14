//
//  LanguageViewController.swift
//  PayZan
//
//  Created by N@n!'$ Mac on 11/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
import AVFoundation
import Localize

class LanguageViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {
    
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("hello.world".localize())
        print("name".localize(value: "Andres"))
        print("values".localize(values: "Andres", "Software Developer"))
        print("username".localize(dictionary: ["username": "andresilvagomez"]))
        print("level.one.two.three".localize())
        print("the.same.lavel".localize())
        
        
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
        
//       self.changeToLanguage("en")
        
        let actionSheet = UIAlertController(title: nil, message: "app.update.language".localize(), preferredStyle: UIAlertControllerStyle.actionSheet)
        for language in Localize.availableLanguages() {
            let displayName = Localize.displayNameForLanguage(language)
            let languageAction = UIAlertAction(title: displayName, style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
                Localize.update(language: language)
                
                
            })
            actionSheet.addAction(languageAction)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: {
            (alert: UIAlertAction) -> Void in
        })
        actionSheet.addAction(cancelAction)
        
        self.present(actionSheet, animated: true, completion: nil)
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

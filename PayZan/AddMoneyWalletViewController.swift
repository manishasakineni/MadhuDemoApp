//
//  AddMoneyWalletViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 13/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class AddMoneyWalletViewController: UIViewController {
    
    @IBOutlet weak var walletAmountField: UITextField!
    
    @IBOutlet weak var promoCodeField: UITextField!

    @IBOutlet weak var addMoneyBtn: UIButton!
    
    @IBOutlet weak var offersView: UIView!
    
    var userId:String?
    var walletId:String?
    
    let serviceController = ServiceController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addMoneyBtn.backgroundColor = hexStringToUIColor(hex: "#5f1a58")
        
        addMoneyBtn.backgroundColor = hexStringToUIColor(hex: "#8d2029")
        
        addMoneyBtn.layer.cornerRadius = 5
        
        let defaults = UserDefaults.standard
        
        if let userid = defaults.string(forKey: "userIDD") {
            
            userId = userid
            
            print("defaults savedString: \(userid)")
        }
        if let walletid = defaults.string(forKey: "walletIDD") {
            
            walletId = walletid
            
            print("defaults savedString: \(walletid)")
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addMoneyAction(_ sender: Any) {
        
        
        
//        "WalletId": "86233014-8531-4974-a2af-392dbefe9e12",
//        "Amount": 100,
//        "TransactionTypeId": 1,
//        "ReasonTypeId": 1,
//        "Id": 0,
//        "IsActive": true,
//        "CreatedByUserId": "c382ef7c-b7e0-4426-b032-ed24c832f2f3",
//        "CreatedDate": "2017-10-13T18:13:30.429Z",
//        "UpdatedByUserId": "c382ef7c-b7e0-4426-b032-ed24c832f2f3",
//        "UpdatedDate": "2017-10-13T18:13:30.429Z"
        
        let walletField:String = walletAmountField.text!
        
        let  strUrl = walletUrl
        
        
        let dictParams = ["WalletId":walletId!,"Amount":walletField,"TransactionTypeId":1,"ReasonTypeId":1,"Id":0,"IsActive":true,"CreatedByUserId":userId!,"CreatedDate":"2017-10-13T18:13:30.429Z","UpdatedByUserId":userId!,"UpdatedDate":"2017-10-13T18:13:30.429Z"] as NSDictionary
        
        print("dic params \(dictParams)")
        
        let dictHeaders = ["":"","":""] as NSDictionary
        
        serviceController.requestPOSTURL(strURL: strUrl as NSString, postParams: dictParams, postHeaders: dictHeaders, successHandler:{(result) in
            DispatchQueue.main.async()
                {
                    
                    print("result:\(result)")
                    
                    let respVO:ResultVo = Mapper().map(JSONObject: result)!
                    
                    
                    print("responseString = \(respVO)")
                    
                    
                    let statusCode = respVO.IsSuccess
                    
                    print("StatusCode:\(String(describing: statusCode))")
                    
                    //                        let strStatusCode = result.value(forKey: "StatusCode") as! Int
                    //                        print("strStatusCode",strStatusCode)
                    
                    if statusCode == true
                    {
                        
                        let successMsg = respVO.EndUserMessage
                        
                        let alertController = UIAlertController(title: "Success", message: successMsg! , preferredStyle: UIAlertControllerStyle.alert)
                        
                        let DestructiveAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                        }
                        alertController.addAction(DestructiveAction)
                        self.present(alertController, animated: true, completion: nil)
                    
                        
                        
                    }
                    else if statusCode == false{
                        
                        let alertController = UIAlertController(title: "Message", message: "Not Add Money to Wallet" , preferredStyle: UIAlertControllerStyle.alert)
                        
                        let DestructiveAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                        }
                        alertController.addAction(DestructiveAction)
                        self.present(alertController, animated: true, completion: nil)
                        
                        
                    }
                        
                    else
                    {
                        
                        let alertController = UIAlertController(title: "", message: "Services not Working" , preferredStyle: UIAlertControllerStyle.alert)
                        
                        let DestructiveAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                        }
                        alertController.addAction(DestructiveAction)
                        self.present(alertController, animated: true, completion: nil)
                        
                    }
            }
        }, failureHandler: {(error) in
        })
        
    }

    @IBAction func backAction(_ sender: Any) {
    }
   
    @IBAction func searchAction(_ sender: Any) {
    }

    @IBAction func notificationAction(_ sender: Any) {
    }
}

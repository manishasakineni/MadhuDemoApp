//
//  AddMoneyWalletViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 13/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class AddMoneyWalletViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var walletAmountField: UITextField!
    
    @IBOutlet weak var promoCodeField: UITextField!

    @IBOutlet weak var addMoneyBtn: UIButton!
    
    @IBOutlet weak var offersView: UIView!
    
    
    @IBOutlet var addmoneyWalletView: UIView!
    
    @IBOutlet var mytransactionView: UIView!
    
    @IBOutlet var sendMoneyWalletView: UIView!
    
    @IBOutlet var mySegmentControl: UISegmentedControl!
    
    @IBOutlet var addBtn1: UIButton!
    
    @IBOutlet var addBtn2: UIButton!
    
    @IBOutlet var addBtn3: UIButton!
    
    @IBOutlet weak var myTransactionTableView: UITableView!
    
    var userId:String?
    var walletId:String?
    
    let serviceController = ServiceController()
    
    var walletArr = ["PayZan Cash Received","Transferred to bank Account"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTransactionTableView.dataSource = self
        myTransactionTableView.delegate = self
        
//      let color1 = hexStringToUIColor(hex: "#5f1a58")
        
//      addBtn1.backgroundColor = color1
        
//      addBtn1.backgroundColor = hexStringToUIColor(hex: "#8d2029")
        
        addBtn1.layer.borderWidth = 1
        addBtn2.layer.borderWidth = 1
        addBtn3.layer.borderWidth = 1
        
        addBtn1.layer.borderColor = UIColor.init(red:255/255.0, green:200/255.0, blue:200/255.0, alpha: 1.0).cgColor
        addBtn2.layer.borderColor = UIColor.init(red:255/255.0, green:200/255.0, blue:200/255.0, alpha: 1.0).cgColor
        addBtn3.layer.borderColor = UIColor.init(red:255/255.0, green:200/255.0, blue:200/255.0, alpha: 1.0).cgColor
        
        sendMoneyWalletView.isHidden = false
        addmoneyWalletView.isHidden = true
        mytransactionView.isHidden = true
        
//        addMoneyBtn.backgroundColor = hexStringToUIColor(hex: "#5f1a58")
//        
//        addMoneyBtn.backgroundColor = hexStringToUIColor(hex: "#8d2029")
//        
//        addMoneyBtn.layer.cornerRadius = 5
        
        walletAmountField.keyboardType = .numberPad
        
        
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return walletArr.count
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = Bundle.main.loadNibNamed("MyTransactionTableViewCell", owner: self, options: nil)?.first as! MyTransactionTableViewCell
        
        //        cell.ImgeVw.image = #imageLiteral(resourceName: "Thumb Sign")
        cell.titleLabel?.text = walletArr[indexPath.row]
        
//        cell.ImgeVw.image = imageArray1[indexPath.row]
        
//        cell.layer.borderWidth = 0.5
//        cell.layer.borderColor = UIColor.lightGray.cgColor
        
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
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
                        
                        let waleetBalance = respVO.Result?.Balance
                        
                        let defaults = UserDefaults.standard
                        
                        // Save String value to UserDefaults
                        // Using defaults.set(value: Any?, forKey: String)
                        defaults.set(waleetBalance, forKey: "walletAmount")
                        
                        
                        let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                        self.navigationController?.pushViewController(homeViewController, animated: true)
                        
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
        
        self.navigationController?.popViewController(animated: true)
    }
   
    @IBAction func searchAction(_ sender: Any) {
    }

    @IBAction func notificationAction(_ sender: Any) {
    }
    
    @IBAction func mySegmentAction(_ sender: Any) {
        
        
        switch mySegmentControl.selectedSegmentIndex {
        case 0:
            
            sendMoneyWalletView.isHidden = false
            addmoneyWalletView.isHidden = true
            mytransactionView.isHidden = true
            
        case 1:
            
            sendMoneyWalletView.isHidden = true
            addmoneyWalletView.isHidden = false
            mytransactionView.isHidden = true
            
        case 2:
            
            sendMoneyWalletView.isHidden = true
            addmoneyWalletView.isHidden = true
            mytransactionView.isHidden = false
            
        default:
            break;
        }
    }
    
    
}

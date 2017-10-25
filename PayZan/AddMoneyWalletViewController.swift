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
    
    @IBOutlet weak var addWalletFiled: UITextField!
    
    @IBOutlet weak var walletPromoField: UITextField!
    
    @IBOutlet weak var circleField: UITextField!
    

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
    
    @IBOutlet weak var phoneBookBtn: UIButton!
    
    var indexValue:Int!
    
    var isHiddenSendView:Bool?
    var isHiddenWithdrawView:Bool?
    var isHiddenTransactionView:Bool?
    
    var userId:String?
    var walletId:String?
    
    let serviceController = ServiceController()
    
    var walletArr = ["PayZan Cash Received","Transferred to bank Account"]
    
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        mySegmentControl.removeBorders()
        
        let font = UIFont.systemFont(ofSize: 10)
        mySegmentControl.setTitleTextAttributes([NSFontAttributeName: font],
                                                for: .normal)
        let attr = NSDictionary(object: UIFont(name: "HelveticaNeue-Bold", size: 10.0)!, forKey: NSFontAttributeName as NSCopying)
        UISegmentedControl.appearance().setTitleTextAttributes(attr as [NSObject : AnyObject] , for: .normal)
        
        mySegmentControl.backgroundColor = #colorLiteral(red: 0.9351081285, green: 0.9351081285, blue: 0.9351081285, alpha: 1)
        mySegmentControl.setTitleTextAttributes([NSFontAttributeName:UIFont(name:"Helvetica Neue", size:10.0)!,NSForegroundColorAttributeName:#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)], for:UIControlState.normal)
        
        mySegmentControl.setTitleTextAttributes([NSFontAttributeName:UIFont(name:"Helvetica Neue", size:10.0)!,NSForegroundColorAttributeName:#colorLiteral(red: 0.4438641369, green: 0.09910114855, blue: 0.1335680187, alpha: 1)], for:UIControlState.selected)
        
        mySegmentControl.setDividerImage(self.imageWithColor(color: UIColor.clear), forLeftSegmentState: UIControlState.normal, rightSegmentState: UIControlState.normal, barMetrics: UIBarMetrics.default)
        
        mySegmentControl.setBackgroundImage(self.imageWithColor(color: UIColor.clear), for:UIControlState.normal, barMetrics:UIBarMetrics.default)
        
//        mySegmentControl.setBackgroundImage(self.imageWithColor(color: UIColor.init(red: 215/255.0, green: 0.0, blue: 30/255.0, alpha:1.0)), for:UIControlState.selected, barMetrics:UIBarMetrics.default);
        
        for  borderview in mySegmentControl.subviews {
            
            let upperBorder: CALayer = CALayer()
            upperBorder.backgroundColor = UIColor.init(red: 113/255.0, green: 25/255.0, blue: 34/255.0, alpha: 1.0).cgColor
            upperBorder.frame = CGRect(x:0, y:borderview.frame.size.height-1, width:borderview.frame.size.width, height:1.0)
            borderview.layer .addSublayer(upperBorder);
            
        }
        
        myTransactionTableView.dataSource = self
        myTransactionTableView.delegate = self
        
        walletAmountField.layer.borderWidth = 0.5
        walletAmountField.layer.borderColor = UIColor.lightGray.cgColor
        walletAmountField.layer.cornerRadius = 3
        
        promoCodeField.layer.borderWidth = 0.5
        promoCodeField.layer.borderColor = UIColor.lightGray.cgColor
        promoCodeField.layer.cornerRadius = 3
        
        addWalletFiled.layer.borderWidth = 0.5
        addWalletFiled.layer.borderColor = UIColor.lightGray.cgColor
        addWalletFiled.layer.cornerRadius = 3
        
        walletPromoField.layer.borderWidth = 0.5
        walletPromoField.layer.borderColor = UIColor.lightGray.cgColor
        walletPromoField.layer.cornerRadius = 3
        
        circleField.layer.borderWidth = 0.5
        circleField.layer.borderColor = UIColor.lightGray.cgColor
        circleField.layer.cornerRadius = 3
        

        
        if indexValue != nil {
            
        mySegmentControl.selectedSegmentIndex = indexValue
            
        }
        
//      let color1 = hexStringToUIColor(hex: "#5f1a58")
        
//      addBtn1.backgroundColor = color1
        
//      addBtn1.backgroundColor = hexStringToUIColor(hex: "#8d2029")
        
        addBtn1.layer.borderWidth = 1
        addBtn2.layer.borderWidth = 1
        addBtn3.layer.borderWidth = 1
        
        addBtn1.layer.borderColor = UIColor.init(red: 113/255.0, green: 25/255.0, blue: 34/255.0, alpha: 1.0).cgColor
        addBtn2.layer.borderColor = UIColor.init(red: 113/255.0, green: 25/255.0, blue: 34/255.0, alpha: 1.0).cgColor
        addBtn3.layer.borderColor = UIColor.init(red: 113/255.0, green: 25/255.0, blue: 34/255.0, alpha: 1.0).cgColor
        
        if isHiddenSendView != nil {
            
            sendMoneyWalletView.isHidden = isHiddenSendView!
        }
        if isHiddenWithdrawView != nil {
            
            addmoneyWalletView.isHidden = isHiddenWithdrawView!
        }
        if isHiddenTransactionView != nil {
            
            mytransactionView.isHidden = isHiddenTransactionView!
        }
        
//        sendMoneyWalletView.isHidden = false
//        addmoneyWalletView.isHidden = true
//        mytransactionView.isHidden = true
        
        
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
        
        
        if(appDelegate.checkInternetConnectivity()){
            
      
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
        else {
            
            appDelegate.window?.makeToast("The Internet connection appears to be offline. Please connect to the internet", duration:kToastDuration, position:CSToastPositionCenter)
            return
            
        }
        
    }

    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
   
    @IBAction func searchAction(_ sender: Any) {
    }

    @IBAction func notificationAction(_ sender: Any) {
    }
    
    @IBAction func phoneBookAction(_ sender: Any) {
        
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

extension UISegmentedControl {
    
    func customizeAppearance(for height: Int) {
        
        setTitleTextAttributes([NSFontAttributeName:UIFont(name:"Helvetica Neue", size:13.0)!,NSForegroundColorAttributeName:UIColor.white], for:.normal)
        setTitleTextAttributes([NSFontAttributeName:UIFont(name:"Helvetica Neue", size:13.0)!,NSForegroundColorAttributeName:UIColor.white], for:.selected)
        setDividerImage(UIImage().colored(with: .clear, size: CGSize(width: 1, height: height)), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        setBackgroundImage(UIImage().colored(with: .clear, size: CGSize(width: 1, height: height)), for: .normal, barMetrics: .default)
        setBackgroundImage(UIImage().colored(with: UIColor.init(red: 215/255.0, green: 0.0, blue: 30/255.0, alpha: 1.0), size: CGSize(width: 1, height: height)), for: .selected, barMetrics: .default);
        
        for  borderview in subviews {
            let upperBorder: CALayer = CALayer()
            upperBorder.backgroundColor = UIColor.init(red: 215/255.0, green: 0.0, blue: 30/255.0, alpha: 1.0).cgColor
            upperBorder.frame = CGRect(x: 0, y: borderview.frame.size.height-1, width: borderview.frame.size.width, height: 1)
            borderview.layer.addSublayer(upperBorder)
        }
        
    }
    
    func removeBorders() {
        setBackgroundImage(imageWithColor(color: backgroundColor!), for: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: tintColor!), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(color: UIColor.clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }
    
    // create a 1x1 image with this color
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}
extension UIImage {
    
    func colored(with color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}

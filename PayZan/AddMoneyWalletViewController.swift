//
//  AddMoneyWalletViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 13/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
import ContactsUI

class AddMoneyWalletViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate,CNContactPickerDelegate {
    
    @IBOutlet weak var walletBalLabel: UILabel!
   
    
    @IBOutlet weak var mobileNumField: UITextField!
    
    @IBOutlet weak var sendAmountField: UITextField!
    
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
    
//    var appDelegate = AppDelegate()
    
    var indexValue:Int!
    
    var myTranResultList:[MyTranListResultVo] = []
    
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
        
        if let text = addBtn1.titleLabel?.text {
            print(text)
        }
        
//        mySegmentControl.removeBorders()
        
        let font = UIFont.systemFont(ofSize: 10)
        mySegmentControl.setTitleTextAttributes([NSFontAttributeName: font],
                                                for: .normal)
        let attr = NSDictionary(object: UIFont(name: "HelveticaNeue-Bold", size: 10.0)!, forKey: NSFontAttributeName as NSCopying)
        UISegmentedControl.appearance().setTitleTextAttributes(attr as [NSObject : AnyObject] , for: .normal)
        
        mySegmentControl.backgroundColor = #colorLiteral(red: 0.9787510536, green: 0.9787510536, blue: 0.9787510536, alpha: 1)
        mySegmentControl.setTitleTextAttributes([NSFontAttributeName:UIFont(name:"Helvetica Neue", size:11.0)!,NSForegroundColorAttributeName:#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)], for:UIControlState.normal)
        
        mySegmentControl.setTitleTextAttributes([NSFontAttributeName:UIFont(name:"Helvetica Neue", size:11.0)!,NSForegroundColorAttributeName:#colorLiteral(red: 0.4438641369, green: 0.09910114855, blue: 0.1335680187, alpha: 1)], for:UIControlState.selected)
        
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
        
        mobileNumField.layer.borderWidth = 0.5
        mobileNumField.layer.borderColor = UIColor.lightGray.cgColor
        mobileNumField.layer.cornerRadius = 3
        mobileNumField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        sendAmountField.layer.borderWidth = 0.5
        sendAmountField.layer.borderColor = UIColor.lightGray.cgColor
        sendAmountField.layer.cornerRadius = 3
        sendAmountField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        addWalletFiled.layer.borderWidth = 0.5
        addWalletFiled.layer.borderColor = UIColor.lightGray.cgColor
        addWalletFiled.layer.cornerRadius = 3
        addWalletFiled.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        walletPromoField.layer.borderWidth = 0.5
        walletPromoField.layer.borderColor = UIColor.lightGray.cgColor
        walletPromoField.layer.cornerRadius = 3
        walletPromoField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        circleField.layer.borderWidth = 0.5
        circleField.layer.borderColor = UIColor.lightGray.cgColor
        circleField.layer.cornerRadius = 3
        circleField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        

        
        if indexValue != nil {
            
        mySegmentControl.selectedSegmentIndex = indexValue
            
        }
        
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
        
        mobileNumField.keyboardType = .phonePad
        addWalletFiled.keyboardType = .numberPad
        sendAmountField.keyboardType = .numberPad
        
        let defaults = UserDefaults.standard
        
        if let userid = defaults.string(forKey: userIDD) {
            
            userId = userid
            
            print("defaults savedString: \(userid)")
        }
        if let walletid = defaults.string(forKey: walletIDD) {
            
            walletId = walletid
            
            print("defaults savedString: \(walletid)")
            
        }
        
        if let walletAmount = defaults.string(forKey: "walletAmount") {
            
            
            walletBalLabel.text = walletAmount
            
            print("defaults savedString: \(walletAmount)")
        }
        
        myTransactionGetService()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.tabBarController?.tabBar.isHidden = false
        
        let defaults = UserDefaults.standard
        
        if let walletAmount = defaults.string(forKey: "walletAmount") {
            
            
            walletBalLabel.text = walletAmount
            
            print("defaults savedString: \(walletAmount)")
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myTranResultList.count
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = Bundle.main.loadNibNamed("MyTransactionTableViewCell", owner: self, options: nil)?.first as! MyTransactionTableViewCell
        
        //        cell.ImgeVw.image = #imageLiteral(resourceName: "Thumb Sign")
        
        let listResult:MyTranListResultVo = myTranResultList[indexPath.row]
        
        cell.titleLabel?.text = listResult.TransactionType
        
        let amount = String(describing: listResult.Amount!)
        
        cell.addMoneyLabel.text = amount
        
        let dateStr = listResult.Created
        
        print("dateStr:\(String(describing: dateStr))")
        
        let currentStr:String = String(dateStr!.characters.prefix(10))
        
        print("currentStr:\(String(describing: currentStr))")
        
        
//        2017-10-30T04:37:57.006+00:00
        
        // "4:44 PM on June 23, 2016\n"
//        0001-01-01T00:00:00+00:00
        let formatter = DateFormatter()
        formatter.dateFormat = currentStr
//        formatter.dateFormat = "h:mm a 'on' \(currentStr)"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        
        let myString = formatter.string(from: Date())
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
//        formatter.dateFormat = "h:mm:ss a 'on' MMM dd,yyyy"
        formatter.dateFormat = "MMM dd,yyyy"
        // again convert your date to string
        let myStringafd = formatter.string(from: yourDate!)
        
        print(myStringafd)
        
        cell.dateLabel.text = myStringafd
        cell.fromLabel.text = listResult.Modified
        
//        cell.ImgeVw.image = imageArray1[indexPath.row]
        
//        cell.layer.borderWidth = 0.5
//        cell.layer.borderColor = UIColor.lightGray.cgColor
        
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    
    func myTransactionGetService(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            print("walletId:\(String(describing: walletId))")
            
            let strUrl = myTransactionsUrl + "/" + walletId!
            
            print("strUrl: \(strUrl)")
            
            let url : NSURL = NSURL(string: strUrl)!
            
            serviceController.requestGETURL(strURL:url, success:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        let respVO:MyTransactionsVo = Mapper().map(JSONObject: result)!
                        
                        
                        let isActive = respVO.IsSuccess
                        
                        
                        if(isActive == true){
                            
                            let listResultVo = respVO.ListResult
                            
                            self.myTranResultList = listResultVo!
                            
                            
                            DispatchQueue.main.async(execute: { () -> Void in
                                
                                self.myTransactionTableView.reloadData()
                            })
                            
                            
                        }else if(isActive == false) {
                            
                            self.view.makeToast("Service not found", duration:kToastDuration, position:CSToastPositionCenter)
                            
                        }
                        //  MBProgressHUD.hide(for:self.appDelegate.window, animated: true)
                }
            }, failure:  {(error) in
            })
            
        }
        else {
            
            appDelegate.window?.makeToast("The Internet connection appears to be offline. Please connect to the internet", duration:kToastDuration, position:CSToastPositionCenter)
            return
        }
        
    }
    
   func postWalletMoneyService(){
    
        
        let walletField:String = addWalletFiled.text!
        
        let  strUrl = walletUrl
    
    let currentDate = GlobalSupportingClass.getCurrentDate()
    
    print("currentDate\(currentDate)")
    
        let dictParams = ["WalletId":walletId!,"Amount":walletField,"TransactionTypeId":1,"ReasonTypeId":1,"Id":0,"IsActive":true,"CreatedByUserId":userId!,"CreatedDate":currentDate,"UpdatedByUserId":userId!,"UpdatedDate":currentDate] as NSDictionary
        
        print("dic params \(dictParams)")
        
        let dictHeaders = ["":"","":""] as NSDictionary
    
//    let dictHeaders = ["Authorization":UserDefaults.standard.value(forKey: accessToken) as! String,"Authorization":UserDefaults.standard.value(forKey: accessToken) as! String] as NSDictionary
    
      print("dictHeader:\(dictHeaders)")
    
        serviceController.requestPOSTURL(strURL: strUrl as NSString, postParams: dictParams, postHeaders: dictHeaders, successHandler:{(result) in
            DispatchQueue.main.async()
                {
                    
                    print("result:\(result)")
                    
                    let respVO:ResultVo = Mapper().map(JSONObject: result)!
                    
                    
                    print("responseString = \(respVO)")
                    
                    
                    let statusCode = respVO.IsSuccess
                    
                    print("StatusCode:\(String(describing: statusCode))")
                    
                    
                    if statusCode == true
                    {
                        
                        let successMsg = respVO.EndUserMessage
                        
                        let waleetBalance = respVO.Result?.Balance
                        
                        let defaults = UserDefaults.standard
                        
                        defaults.set(waleetBalance, forKey: "walletAmount")
                        
                        
                        let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                        self.navigationController?.pushViewController(homeViewController, animated: true)
                        
                        self.showAlertViewWithTitle("Alert", message: successMsg!, buttonTitle: "Ok")

                        
                    }
                    else if statusCode == false{
                        
                        let failMsg = respVO.EndUserMessage
                        
                        self.showAlertViewWithTitle("Failed", message: failMsg!, buttonTitle: "Ok")
                        
                        
                    }
                        
                    else
                    {
                        
                        let failMsg = respVO.EndUserMessage
                        
                        self.showAlertViewWithTitle("Failed", message: failMsg!, buttonTitle: "Ok")
                        
                    }
            }
        }, failureHandler: {(error) in
        })
    
    }

    
    @IBAction func addMoneyAction(_ sender: Any) {
        
        if(appDelegate.checkInternetConnectivity()){
            
            if !(addWalletFiled.text?.isEmpty)! {
                
                postWalletMoneyService()
                
            }
            else {
                
                self.showAlertViewWithTitle("Alert", message: "Please enter wallet amount", buttonTitle: "Ok")
            
            }
            
        }
        else {
            
        appDelegate.window?.makeToast("The Internet connection appears to be offline. Please connect to the internet", duration:kToastDuration, position:CSToastPositionCenter)
            return
            
        }
        
        
    }
    
    func sendMoneyToWalletService(){
        
        
        let walletField:String = sendAmountField.text!
        
        let phone:String = mobileNumField.text!
        
        let  strUrl = sendWalletUrl
        
//        let null = NSNull()
        
        let currentDate = GlobalSupportingClass.getCurrentDate()
        
        print("currentDate\(currentDate)")
        
        let dictParams = ["userWalletHistory": [
            "WalletId": walletId!,
            "Amount": walletField,
            "TransactionTypeId": "9",
            "ReasonTypeId": "10",
            "Id": 0,
            "IsActive": true,
            "CreatedBy": userId!,
            "ModifiedBy": userId!,
            "Created": currentDate,
            "Modified": currentDate
            ],"recieverUserName": phone] as NSDictionary
        
        print("dic params \(dictParams)")
        
        let dictHeaders = ["":"","":""] as NSDictionary
        
        //    let dictHeaders = ["Authorization":UserDefaults.standard.value(forKey: accessToken) as! String,"Authorization":UserDefaults.standard.value(forKey: accessToken) as! String] as NSDictionary
        
        print("dictHeader:\(dictHeaders)")
        
        serviceController.requestPOSTURL(strURL: strUrl as NSString, postParams: dictParams, postHeaders: dictHeaders, successHandler:{(result) in
            DispatchQueue.main.async()
                {
                    
                    print("result:\(result)")
                    
                    let respVO:SendWalletVo = Mapper().map(JSONObject: result)!
                    
                    
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
                        
                         self.showAlertViewWithTitle("Success", message: successMsg!, buttonTitle: "Ok")
                        
                        
                    }
                    else if statusCode == false{
                        
                        let failMsg = respVO.EndUserMessage
                        
                        self.showAlertViewWithTitle("Failed", message: failMsg!, buttonTitle: "Ok")

                        
                        
                    }
                        
                    else
                    {
                        
                        let failMsg = respVO.EndUserMessage
                        
                        self.showAlertViewWithTitle("Failed", message: failMsg!, buttonTitle: "Ok")
                        
                    }
            }
        }, failureHandler: {(error) in
        })
        
    }
    
    @IBAction func sendMoneyAction(_ sender: Any) {
        
        
        
        if(appDelegate.checkInternetConnectivity()){
            
            if !(sendAmountField.text?.isEmpty)! {
                
                sendMoneyToWalletService()
                
            }
            else {
                
                 self.showAlertViewWithTitle("Alert", message: "Please enter wallet amount", buttonTitle: "Ok")
                
            }
            
        }
        else {
            
            self.appDelegate.window?.makeToast("The Internet connection appears to be offline. Please connect to the internet", duration:kToastDuration, position:CSToastPositionCenter)
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
        
        let cnPicker = CNContactPickerViewController()
        cnPicker.delegate = self
        self.present(cnPicker, animated: true, completion: nil)
        
    }
    
    //MARK:- CNContactPickerDelegate Method
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        contacts.forEach { contact in
            for number in contact.phoneNumbers {
                let phoneNumber = number.value
                print("number is = \(phoneNumber)")
                
                mobileNumField.text = phoneNumber.stringValue
                
                
            }
            
            let cnContacts = [CNContact]()
            
            for contact in cnContacts {
                let fullName = CNContactFormatter.string(from: contact, style: .fullName) ?? "No Name"
                print("\(fullName): \(contact.phoneNumbers.description)")
            }
        }
    }
    //    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
    //        print("Cancel Contact Picker")
    //    }
    
    
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

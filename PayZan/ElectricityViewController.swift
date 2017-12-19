//
//  ElectricityViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 13/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class ElectricityViewController: BaseViewController,UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var districtsFiled: UITextField!
    
    @IBOutlet weak var serviceNumField: UITextField!

    @IBOutlet weak var amountField: UITextField!
    
    @IBOutlet weak var payNowBtn: UIButton!
    
    @IBOutlet weak var offersView: UIView!
    
    @IBOutlet weak var distImg: UIImageView!
    
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    var serviceController = ServiceController()
    
    var myPickerView : UIPickerView!
    
    var toolBar = UIToolbar()
    
    var userId:String?
    var walletId:String?

    
    var pickerData = ["District1" , "District2" , "District3" , "District4"]
    
    var operatorList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        districtsFiled.layer.borderWidth = 0.5
        districtsFiled.layer.borderColor = UIColor.lightGray.cgColor
        districtsFiled.layer.cornerRadius = 3
        districtsFiled.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        serviceNumField.layer.borderWidth = 0.5
        serviceNumField.layer.borderColor = UIColor.lightGray.cgColor
        serviceNumField.layer.cornerRadius = 3
        serviceNumField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        amountField.layer.borderWidth = 0.5
        amountField.layer.borderColor = UIColor.lightGray.cgColor
        amountField.layer.cornerRadius = 3
        amountField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        serviceNumField.keyboardType = .numberPad
        amountField.keyboardType = .numberPad
        
        districtsFiled.delegate = self
        
        let five = PayZanServices.AgentType
        print(five.rawValue)
        
        getOperatorList()
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
    }
    

    func pickUp(_ textField : UITextField){
        
        // UIPickerView
        self.myPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.myPickerView.delegate = self
        self.myPickerView.dataSource = self
        self.myPickerView.backgroundColor = UIColor.white
        if operatorList.isEmpty {
            
            self.myPickerView.isHidden = true
            
            districtsFiled.text = "No Boards"
            districtsFiled.textColor = UIColor.red
            districtsFiled.isUserInteractionEnabled = false
            
        }else {
            
            textField.inputView = self.myPickerView
        }
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = #colorLiteral(red: 0.4438641369, green: 0.09910114855, blue: 0.1335680187, alpha: 1)
//            UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(RechargeViewController.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(RechargeViewController.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }
    
    //MARK:- Button
    func doneClick() {
        districtsFiled.resignFirstResponder()
    }
    func cancelClick() {
        districtsFiled.resignFirstResponder()
    }
    
    //MARK:- TextFiled Delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    
            self.pickUp(districtsFiled)
        
           districtsFiled = textField
        
        }
    
    //MARK:- PickerView Delegate & DataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return operatorList.count
        
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return operatorList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
            self.districtsFiled.text = operatorList[row]
        
    }
    
    func getOperatorList(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            let strUrl = electricityUrl
            
//            let url : NSURL = NSURL(string: strUrl)!
            
            serviceController.requestGETURL(strURL:strUrl, success:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        let respVO:OperatorVo = Mapper().map(JSONObject: result)!
                        
                        
                        
                        let isActive = respVO.IsSuccess
                        
                        
                        //                    let status = result["status"] as! String
                        
                        if(isActive == true){
                            
                            let operatorObj = respVO.ListResult
                            
                            
                            for(index,element) in (operatorObj?.enumerated())! {
                                
                                print("index:\(index)")
                                self.operatorList.append(element.Name!)
                                
                            }
                            
                            
                        }else if(isActive == false) {
                            
                            self.view.makeToast("Service not found", duration:kToastDuration, position:CSToastPositionCenter)
                            
                        }

                }
            }, failure:  {(error) in
            })
            
        }
        else {
            
            self.districtsFiled.isUserInteractionEnabled = false
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
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

    @IBAction func payNowAction(_ sender: Any) {
        
        
        if(appDelegate.checkInternetConnectivity()){
            
            if walletId != nil && userId != nil {
                
                //                sendMoneyToWalletService()
                
            }
            else {
                
                let alertController = UIAlertController(title: "app.Alert".localize(), message: "app.LoginAlert".localize(), preferredStyle: UIAlertControllerStyle.alert)
                
                
                let cancelAction = UIAlertAction(title: "app.Cancel".localize(), style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
                    print("Cancel")
                    
                    
                }
                let okAction = UIAlertAction(title: "app.Ok".localize(), style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                    print("OK")
                    
                    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    
                    let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginNav") as! UINavigationController
                    //                    let navigationController = UINavigationController(rootViewController: viewController)
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.window?.rootViewController = viewController
                }
                alertController.addAction(cancelAction)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
                
            }
            
            
        }
        else {
            
            self.appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
            
        }
        

        
    }
}

//
//  CableTvViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 13/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class CableTvViewController: BaseViewController,UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    
    @IBOutlet weak var operatorField: UITextField!
    
    @IBOutlet weak var accountNumField: UITextField!
    
    @IBOutlet weak var amountField: UITextField!
    
    @IBOutlet weak var payNowBtn: UIButton!
    
    @IBOutlet weak var offersView: UIView!
    
    var myPickerView : UIPickerView!
    
    var toolBar = UIToolbar()
    
    var userId:String?
    var walletId:String?
    

    
    var pickerData = ["Operator1" , "Operator2" , "Operator3" , "Operator4"]
    
    let serviceController = ServiceController()
    
    var operatorList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        operatorField.layer.borderWidth = 0.5
        operatorField.layer.borderColor = UIColor.lightGray.cgColor
        operatorField.layer.cornerRadius = 3
        operatorField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        accountNumField.layer.borderWidth = 0.5
        accountNumField.layer.borderColor = UIColor.lightGray.cgColor
        accountNumField.layer.cornerRadius = 3
        accountNumField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        amountField.layer.borderWidth = 0.5
        amountField.layer.borderColor = UIColor.lightGray.cgColor
        amountField.layer.cornerRadius = 3
        amountField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        operatorField.delegate = self
                
        getOperatorList()
        
        accountNumField.keyboardType = .numberPad
        amountField.keyboardType = .numberPad

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickUp(_ textField : UITextField){
        
        // UIPickerView
        self.myPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.myPickerView.delegate = self
        self.myPickerView.dataSource = self
        self.myPickerView.backgroundColor = UIColor.white
        if operatorList.isEmpty {
            
            self.myPickerView.isHidden = true
            
            operatorField.text = "No Operators"
            operatorField.textColor = UIColor.red
            operatorField.isUserInteractionEnabled = false
            
        }else {
            operatorField.isUserInteractionEnabled = true
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
        operatorField.resignFirstResponder()
    }
    func cancelClick() {
        operatorField.resignFirstResponder()
    }
    
    //MARK:- TextFiled Delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        self.pickUp(operatorField)
        
        operatorField = textField
        
        self.myPickerView.reloadAllComponents()
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
        
        self.operatorField.text = operatorList[row]
        
    }
    
    func getOperatorList(){
        
        if(appDelegate.checkInternetConnectivity()){
        
        let strUrl = cableTvUrl
        
        let url : NSURL = NSURL(string: strUrl)!
        
        serviceController.requestGETURL(strURL:url, success:{(result) in
            DispatchQueue.main.async()
                {
                    
                    let respVO:OperatorVo = Mapper().map(JSONObject: result)!
                    
                    
                    
                    let isActive = respVO.IsSuccess
                    
                    
                    
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
             self.operatorField.isUserInteractionEnabled = false
            appDelegate.window?.makeToast("The Internet connection appears to be offline. Please connect to the internet", duration:kToastDuration, position:CSToastPositionCenter)
            return

        }
    }
    
    
    @IBAction func paynowAction(_ sender: Any) {
        
        if(appDelegate.checkInternetConnectivity()){
            
            if walletId != nil && userId != nil {
                
                //                sendMoneyToWalletService()
                
            }
            else {
                
                let alertController = UIAlertController(title: "Alert", message: "Please Login to your PayZan account", preferredStyle: UIAlertControllerStyle.alert)
                
                
                let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
                    print("Cancel")
                    
                    
                }
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                    print("OK")
                    
                    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    
                    let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.window?.rootViewController = viewController
                }
                alertController.addAction(cancelAction)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
                
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

}

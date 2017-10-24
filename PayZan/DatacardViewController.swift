//
//  DatacardViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 13/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class DatacardViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    
    @IBOutlet weak var prepaidCheckBox: UIButton!
    
    @IBOutlet weak var postPaidCheckBox: UIButton!
    
    @IBOutlet weak var operatorField: UITextField!
    
    @IBOutlet weak var datacardNumField: UITextField!
    
    @IBOutlet weak var amountField: UITextField!
    
    @IBOutlet weak var payNowBtn: UIButton!
    
    var myPickerView : UIPickerView!
    
    var toolBar = UIToolbar()
    
    var pickerData = ["Operator1" , "Operator2" , "Operator3" , "Operator4"]
    
    var operatorList = [String]()
    
    var pickerList = [String]()
    
    let serviceController = ServiceController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        payNowBtn.backgroundColor = hexStringToUIColor(hex: "#5f1a58")
//        
//        payNowBtn.backgroundColor = hexStringToUIColor(hex: "#8d2029")
//        
//        payNowBtn.layer.cornerRadius = 5
        
        operatorField.delegate = self
        
        datacardNumField.keyboardType = .numberPad
        amountField.keyboardType = .numberPad
        
        getPrepaidList()

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
        textField.inputView = self.myPickerView
        
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
        
        pickerList.removeAll()
        
        self.pickUp(operatorField)
        
        pickerList = operatorList
        
        operatorField = textField
        
        myPickerView.reloadAllComponents()
        
        myPickerView.selectRow(0, inComponent: 0, animated: false)
        
    }
    
    //MARK:- PickerView Delegate & DataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerList.count
        
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.operatorField.text = pickerList[row]
        
    }
    
    func getPrepaidList(){
        
        if(appDelegate.checkInternetConnectivity()){
        
        let strUrl = datacardUrl
        
        let url : NSURL = NSURL(string: strUrl)!
        
        serviceController.requestGETURL(strURL:url, success:{(result) in
            DispatchQueue.main.async()
                {
                    
                    let respVO:OperatorVo = Mapper().map(JSONObject: result)!
                    
                    let isActive = respVO.IsSuccess
                    
                    
                    if(isActive == true){
                        
                        let operatorObj = respVO.ListResult
                        
                        self.operatorList.removeAll()
                        
                        for(index,element) in (operatorObj?.enumerated())! {
                            
                            print("index:\(index)")
                            self.operatorList.append(element.Name!)
                            
                        }
                        
                        
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
    
    func getPostpaidList(){
        
        if(appDelegate.checkInternetConnectivity()){
        
        let strUrl = postpaidUrl
        
        let url : NSURL = NSURL(string: strUrl)!
        
        serviceController.requestGETURL(strURL:url, success:{(result) in
            DispatchQueue.main.async()
                {
                    
                    let respVO:OperatorVo = Mapper().map(JSONObject: result)!
                    
                    
                    let isActive = respVO.IsSuccess
                    
                    
                    //                    let status = result["status"] as! String
                    
                    if(isActive == true){
                        
                        let operatorObj = respVO.ListResult
                        
                        self.operatorList.removeAll()
                        
                        for(index,element) in (operatorObj?.enumerated())! {
                            
                            print("index:\(index)")
                            
                            self.operatorList.append(element.Name!)
                            
                        }
                        
                        
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
    
    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func searchAction(_ sender: Any) {
        
        
    }
    
    @IBAction func notificationAction(_ sender: Any) {
    }
    
    @IBAction func payNowAction(_ sender: Any) {
    }

    @IBAction func prepaidAction(_ sender: Any) {
        
        
        
        if (postPaidCheckBox.isSelected == true)
        {
            postPaidCheckBox.setBackgroundImage(UIImage(named: "unselectedBox"), for: UIControlState.normal)
            prepaidCheckBox.setBackgroundImage(UIImage(named: "selectedBox"), for: UIControlState.normal)
            
            getPrepaidList()
            
            
            postPaidCheckBox.isSelected = false
        }
        else
        {
            postPaidCheckBox.setBackgroundImage(UIImage(named: "selectedBox"), for: UIControlState.normal)
            prepaidCheckBox.setBackgroundImage(UIImage(named: "unselectedBox"), for: UIControlState.normal)
            
            getPostpaidList()
            postPaidCheckBox.isSelected = true
        }
    }

    @IBAction func postpaidAction(_ sender: Any) {
        
        
        if (postPaidCheckBox.isSelected == true)
        {
            postPaidCheckBox.setBackgroundImage(UIImage(named: "unselectedBox"), for: UIControlState.normal)
            prepaidCheckBox.setBackgroundImage(UIImage(named: "selectedBox"), for: UIControlState.normal)
            getPrepaidList()
            postPaidCheckBox.isSelected = false
        }
        else
        {
            postPaidCheckBox.setBackgroundImage(UIImage(named: "selectedBox"), for: UIControlState.normal)
            prepaidCheckBox.setBackgroundImage(UIImage(named: "unselectedBox"), for: UIControlState.normal)
            getPostpaidList()
            postPaidCheckBox.isSelected = true
        }
    }
}

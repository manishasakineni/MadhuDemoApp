//
//  DatacardViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 13/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class DatacardViewController: BaseViewController,UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    //MARK:- OutLets

    
    @IBOutlet weak var prepaidCheckBox: UIButton!
    
    @IBOutlet weak var postPaidCheckBox: UIButton!
    
    @IBOutlet weak var operatorField: UITextField!
    
    @IBOutlet weak var datacardNumField: UITextField!
    
    @IBOutlet weak var amountField: UITextField!
    
    @IBOutlet weak var payNowBtn: UIButton!
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    let serviceController = ServiceController()

    
    //MARK:- Variables

    var myPickerView : UIPickerView!
    
    var toolBar = UIToolbar()
    
    var pickerData = ["Operator1" , "Operator2" , "Operator3" , "Operator4"]
    
    var operatorList = [String]()
    
    var pickerList = [String]()
    
    var userId:String?
    var walletId:String?
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- TextField Colors

        
        datacardNumField.layer.borderWidth = 0.5
        datacardNumField.layer.borderColor = UIColor.lightGray.cgColor
        datacardNumField.layer.cornerRadius = 3
        datacardNumField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        operatorField.layer.borderWidth = 0.5
        operatorField.layer.borderColor = UIColor.lightGray.cgColor
        operatorField.layer.cornerRadius = 3
        operatorField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        amountField.layer.borderWidth = 0.5
        amountField.layer.borderColor = UIColor.lightGray.cgColor
        amountField.layer.cornerRadius = 3
        amountField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        operatorField.delegate = self
        
        datacardNumField.keyboardType = .numberPad
        amountField.keyboardType = .numberPad
        
        getPrepaidList()
        
        //MARK:- headerImgHeight For iphone and ipad

        
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
    
    //MARK:- UIPickerView

    
    func pickUp(_ textField : UITextField){
        
        
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
        
        //MARK:- ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = #colorLiteral(red: 0.4438641369, green: 0.09910114855, blue: 0.1335680187, alpha: 1)
        toolBar.sizeToFit()
        
        //MARK:- Adding Button ToolBar
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
        
        
        serviceController.requestGETURL(strURL:strUrl, success:{(result) in
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

            }
        }, failure:  {(error) in
        })
            
        }
        else {
             self.operatorField.isUserInteractionEnabled = false
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
        }
        
    }
    
     //MARK:- getPostpaidList
    
    func getPostpaidList(){
        
        if(appDelegate.checkInternetConnectivity()){
        
        let strUrl = postpaidUrl
        
        
        serviceController.requestGETURL(strURL:strUrl, success:{(result) in
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

            }
        }, failure:  {(error) in
        })
            
        }
        else {
            
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
            
        }
        
    }
    
    //MARK:- Button Actions

    
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

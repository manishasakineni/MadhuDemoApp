//
//  BroadbandViewController.swift
//  PayZan
//
//  Created by Ram on 26/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class BroadbandViewController: BaseViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource{
    
    //MARK:- OutLets

    
    @IBOutlet weak var selectOperatorTextField: UITextField!
    
    
    @IBOutlet weak var serviceNumberTextFileld: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var payNowButtonOutLet: UIButton!
    
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    let serviceController = ServiceController()
    
   
    
    //MARK:- Variables

    var myPickerView : UIPickerView!
    var toolBar = UIToolbar()
    var userId:String?
    var walletId:String?
    
    
    
    var operatorList = [String]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- TextField Colors

        
        selectOperatorTextField.layer.borderWidth = 0.5
        selectOperatorTextField.layer.borderColor = UIColor.lightGray.cgColor
        selectOperatorTextField.layer.cornerRadius = 3
        selectOperatorTextField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        serviceNumberTextFileld.layer.borderWidth = 0.5
        serviceNumberTextFileld.layer.borderColor = UIColor.lightGray.cgColor
        serviceNumberTextFileld.layer.cornerRadius = 3
        serviceNumberTextFileld.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        amountTextField.layer.borderWidth = 0.5
        amountTextField.layer.borderColor = UIColor.lightGray.cgColor
        amountTextField.layer.cornerRadius = 3
        amountTextField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        selectOperatorTextField.delegate = self
        
        amountTextField.keyboardType = .numberPad
        serviceNumberTextFileld.keyboardType = .numberPad
        getOperatorList()
        
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
            
            selectOperatorTextField.text = "No Operators"
            selectOperatorTextField.textColor = UIColor.red
            selectOperatorTextField.isUserInteractionEnabled = false
            
        }else {
            selectOperatorTextField.isUserInteractionEnabled = true
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
        selectOperatorTextField.resignFirstResponder()
    }
    func cancelClick() {
        selectOperatorTextField.resignFirstResponder()
    }
    
    //MARK:- TextFiled Delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        self.pickUp(selectOperatorTextField)
        
        selectOperatorTextField = textField
        
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
        
        self.selectOperatorTextField.text = operatorList[row]
        
    }
    
    //MARK:- getOperatorList

    
    func getOperatorList(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            let strUrl = broadbandUrl
            
            
            serviceController.requestGETURL(strURL:strUrl, success:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        let respVO:OperatorVo = Mapper().map(JSONObject: result)!
                        
                        
                        
                        let isActive = respVO.IsSuccess
                        
                        
                        
                        if(isActive == true){
                            
                            let operatorObj = respVO.ListResult
                            
                            
                            for(_,element) in (operatorObj?.enumerated())! {
                                
                                self.operatorList.append(element.Name!)
                                print("fsdfdsfdsfdsf", self.operatorList)
                                
                            }
                            
                            
                        }else if(isActive == false) {
                            
                            self.view.makeToast("Service not found", duration:kToastDuration, position:CSToastPositionCenter)
                            
                        }
                }
                
            },
                                            
             failure:  {(error) in
                
            })
            
        }
        else {
             self.selectOperatorTextField.isUserInteractionEnabled = false
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
        }
    }
    
    
    //MARK:- Button Actions
    
 
    
    
    
    @IBAction func payNowButtonAction(_ sender: Any) {
        
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
    
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        
        
        self.navigationController?.popViewController(animated: true)

    }
    
    

}










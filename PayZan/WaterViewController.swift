//
//  WaterViewController.swift
//  PayZan
//
//  Created by Ram on 26/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class WaterViewController: BaseViewController,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var selectBoardTextField: UITextField!
    @IBOutlet weak var consumerNumberTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var proceedToPayButtonOutLet: UIButton!
    
    var myPickerView : UIPickerView!
    
    var toolBar = UIToolbar()
    
    
    let serviceController = ServiceController()
    
    var operatorList = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectBoardTextField.layer.borderWidth = 0.5
        selectBoardTextField.layer.borderColor = UIColor.lightGray.cgColor
        selectBoardTextField.layer.cornerRadius = 3
        selectBoardTextField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        consumerNumberTextField.layer.borderWidth = 0.5
        consumerNumberTextField.layer.borderColor = UIColor.lightGray.cgColor
        consumerNumberTextField.layer.cornerRadius = 3
        
       // consumerNumberTextField.leftViewMode = .whileEditing
        
        consumerNumberTextField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        amountTextField.layer.borderWidth = 0.5
        amountTextField.layer.borderColor = UIColor.lightGray.cgColor
        amountTextField.layer.cornerRadius = 3
        amountTextField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        selectBoardTextField.delegate = self
        
        amountTextField.keyboardType = .numberPad
        consumerNumberTextField.keyboardType = .numberPad

        
        getOperatorList()


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
            
            selectBoardTextField.text = "No Operators"
            selectBoardTextField.textColor = UIColor.red
            selectBoardTextField.isUserInteractionEnabled = false
            
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
        selectBoardTextField.resignFirstResponder()
    }
    func cancelClick() {
        selectBoardTextField.resignFirstResponder()
    }
    
    //MARK:- TextFiled Delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        self.pickUp(selectBoardTextField)
        
        selectBoardTextField = textField
        
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
        
        self.selectBoardTextField.text = operatorList[row]
        
    }
    
    func getOperatorList(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            let strUrl = waterUrl
            
            let url : NSURL = NSURL(string: strUrl)!
            
            serviceController.requestGETURL(strURL:url, success:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        let respVO:OperatorVo = Mapper().map(JSONObject: result)!
                        
                        
                        
                        let isActive = respVO.IsSuccess
                        
                        
                        if(isActive == true){
                            
                            var operatorObj = respVO.ListResult
                            
                            
                            for(index,element) in (operatorObj?.enumerated())! {
                                
                                self.operatorList.append(element.Name!)
                                
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
             self.selectBoardTextField.isUserInteractionEnabled = false
            appDelegate.window?.makeToast("The Internet connection appears to be offline. Please connect to the internet", duration:kToastDuration, position:CSToastPositionCenter)
            return
        }
    }
    
    
    
    
    

   

    @IBAction func proceedToPayButtonAction(_ sender: Any) {
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        
        
        self.navigationController?.popViewController(animated: true)

    }
    
   
    
    
}

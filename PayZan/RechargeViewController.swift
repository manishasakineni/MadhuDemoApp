//
//  RechargeViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 11/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
import ContactsUI

class RechargeViewController: BaseViewController,UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, CNContactPickerDelegate {

    @IBOutlet weak var backArrowOutLet: NSLayoutConstraint!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var offersView: UIView!
    
    @IBOutlet weak var postPaidView: UIView!
    
    @IBOutlet weak var prepaidView: UIView!
    
    @IBOutlet weak var mobileField: UITextField!
    
    @IBOutlet weak var networkField: UITextField!
    
    @IBOutlet weak var planField: UITextField!
    
    @IBOutlet weak var addressBookBtn: UIButton!
    
    @IBOutlet weak var changeNetworkBtn: UIButton!
    
    @IBOutlet weak var browsePlanBtn: UIButton!
    
    @IBOutlet weak var searchAction: UIButton!
    
    @IBOutlet weak var notificationAction: UIButton!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    @IBOutlet weak var prepaidChecbox: UIButton!
    
    @IBOutlet weak var postpaidCheckbox: UIButton!
    
    @IBOutlet weak var rechargeBtn: UIButton!
    
    var serviceController = ServiceController()
    
    var operatorList = [String]()
    
    var pickerList = [String]()
    
    var myPickerView : UIPickerView!
    
     var toolBar = UIToolbar()
    
    var pickerData = ["Network1" , "Network2" , "Network3" , "Network3"]
    
    var pickerData1 = ["Plan1" , "Plan2" , "Plan3" , "Plan4"]
    
    var pickerSample = Array<String>()
    
    var selectedTextField:Int!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
//        self.tabBarController?.tabBar.isHidden = true
        
        networkField.delegate = self
        
        mobileField.layer.borderWidth = 0.5
        mobileField.layer.borderColor = UIColor.lightGray.cgColor
        mobileField.layer.cornerRadius = 3
        mobileField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        mobileField.keyboardType = .phonePad
        
        networkField.layer.borderWidth = 0.5
        networkField.layer.borderColor = UIColor.lightGray.cgColor
        networkField.layer.cornerRadius = 3
        networkField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        planField.layer.borderWidth = 0.5
        planField.layer.borderColor = UIColor.lightGray.cgColor
        planField.layer.cornerRadius = 3
        planField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        
   //     backArrowOutLet.textContainerInset = UIEdgeInsetsMake(10, 0, 10, 0);

        
        planField.delegate = self
        
        networkField.tag = 1
        planField.tag = 2
        
        getPrepaidList()
        getPostpaidList()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //        headerView.isHidden = false
        
//        self.tabBarController?.tabBar.isHidden = true
        
        super.viewDidAppear(true)
    }
    
    
    func pickUp(_ textField : UITextField){
        
        // UIPickerView
        self.myPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.myPickerView.delegate = self
        self.myPickerView.dataSource = self
        self.myPickerView.backgroundColor = UIColor.white
//        textField.inputView = self.myPickerView
        if operatorList.isEmpty {
            
            self.myPickerView.isHidden = true
            
            networkField.text = "No Operators"
            networkField.textColor = UIColor.red
            networkField.isUserInteractionEnabled = false
            
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
        networkField.resignFirstResponder()
        planField.resignFirstResponder()
    }
    func cancelClick() {
        networkField.resignFirstResponder()
        planField.resignFirstResponder()
    }
    
    //MARK:- TextFiled Delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        

        selectedTextField = textField.tag
        
        if textField == networkField{
            
            pickerList.removeAll()
            
            self.pickUp(networkField)
            
            pickerList = operatorList
            
            networkField = textField
            
//            pickerSample = pickerData
            
            networkField.tag = 1
            
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)

        
        }
        
        else if textField == planField {
            
            pickerSample.removeAll()
            
            pickerSample = pickerData1
            
            planField.tag = 2
            
            self.pickUp(planField)
            
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
        }
        
        
        
    }
    
    //MARK:- PickerView Delegate & DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       
//        return pickerList.count
        
        if (selectedTextField == 1){
            
            return pickerList.count
            
        }else{
            
            return pickerSample.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if (selectedTextField == 1){
            
            return "\(pickerList[row])"
            
        }else{

            return "\(pickerSample[row])"
        }
//       return pickerList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        if (selectedTextField == 1){
            
            self.networkField.text = pickerList[row]
            
        }else if(selectedTextField == 2){
            
            self.planField.text = pickerSample[row]
        }
        
    }
    
    
    func getPrepaidList(){
        
        if(appDelegate.checkInternetConnectivity()){
        
        let strUrl = prepaidUrl
        
//        let url : NSURL = NSURL(string: strUrl)!
        
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
            self.networkField.isUserInteractionEnabled = false
            appDelegate.window?.makeToast("The Internet connection appears to be offline. Please connect to the internet", duration:kToastDuration, position:CSToastPositionCenter)
            return
        }
        
    }
    
    func getPostpaidList(){
        
        if(appDelegate.checkInternetConnectivity()){
        
        let strUrl = postpaidUrl
        
//        let url : NSURL = NSURL(string: strUrl)!
        
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
             self.networkField.isUserInteractionEnabled = false
            appDelegate.window?.makeToast("The Internet connection appears to be offline. Please connect to the internet", duration:kToastDuration, position:CSToastPositionCenter)
            return
        }
    }
    
    
    @IBAction func rechargeAction(_ sender: Any) {
        
        let rechargeViewController = self.storyboard?.instantiateViewController(withIdentifier: "RechargeDetailViewController") as! RechargeDetailViewController
        self.navigationController?.pushViewController(rechargeViewController, animated: true)

    }

    @IBAction func indexChage(_ sender: Any) {
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
          //  postPaidView.isHidden = true
            prepaidView.isHidden = false
        case 1:
           // postPaidView.isHidden = false
            prepaidView.isHidden = false
        default:
            break;
        }
        
    }
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
   
    @IBAction func searchBtnAction(_ sender: Any) {
        
       
        
    }
    
    @IBAction func notificationBtnAction(_ sender: Any) {
        
        
    }
    
    @IBAction func prepaidCheckboxAction(_ sender: UIButton) {
        

        if (postpaidCheckbox.isSelected == true)
        {
            postpaidCheckbox.setBackgroundImage(UIImage(named: "unselectedBox"), for: UIControlState.normal)
            prepaidChecbox.setBackgroundImage(UIImage(named: "selectedBox"), for: UIControlState.normal)
            getPrepaidList()
            postpaidCheckbox.isSelected = false
        }
        else
        {
            postpaidCheckbox.setBackgroundImage(UIImage(named: "selectedBox"), for: UIControlState.normal)
            prepaidChecbox.setBackgroundImage(UIImage(named: "unselectedBox"), for: UIControlState.normal)
            
            getPostpaidList()
            postpaidCheckbox.isSelected = true
        }
        
    }
    
    @IBAction func postpiadChecboxAction(_ sender: UIButton) {
        
        
        if (postpaidCheckbox.isSelected == true)
        {
            postpaidCheckbox.setBackgroundImage(UIImage(named: "unselectedBox"), for: UIControlState.normal)
            prepaidChecbox.setBackgroundImage(UIImage(named: "selectedBox"), for: UIControlState.normal)
            getPrepaidList()
            postpaidCheckbox.isSelected = false
        }
        else
        {
            postpaidCheckbox.setBackgroundImage(UIImage(named: "selectedBox"), for: UIControlState.normal)
            prepaidChecbox.setBackgroundImage(UIImage(named: "unselectedBox"), for: UIControlState.normal)

            getPostpaidList()
            postpaidCheckbox.isSelected = true
        }

    }
    
    @IBAction func changeNetworkAction(_ sender: UIButton) {
        
        

        
    }
    
    @IBAction func browsePlanAction(_ sender: Any) {
        
//        toolBar.isHidden = false
//        myPickerView.isHidden = false
//        
//        planField.inputAccessoryView = toolBar
//        
//        planField.inputView = self.myPickerView
        
        
    }
    
    //MARK:- CNContactPickerDelegate Method
    
    @available(iOS 9.0, *)
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        contacts.forEach { contact in
            for number in contact.phoneNumbers {
                let phoneNumber = number.value
                print("number is = \(phoneNumber)")
                
                mobileField.text = phoneNumber.stringValue
                
                
            }
            
            if #available(iOS 9.0, *) {
                
                let cnContacts = [CNContact]()
                for contact in cnContacts {
                    let fullName = CNContactFormatter.string(from: contact, style: .fullName) ?? "No Name"
                    print("\(fullName): \(contact.phoneNumbers.description)")
                }
            } else {
                // Fallback on earlier versions
            }
            
           
        }
    }
    
    @IBAction func phoneBookAction(_ sender: Any) {
        
        
        if #available(iOS 9.0, *) {
            let cnPicker = CNContactPickerViewController()
            cnPicker.delegate = self
            self.present(cnPicker, animated: true, completion: nil)
        } else {
            // Fallback on earlier versions
        }
        
        
    }

}



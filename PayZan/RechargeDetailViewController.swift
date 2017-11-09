//
//  RechargeDetailViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 12/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
import ContactsUI

class RechargeDetailViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, CNContactPickerDelegate {

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
    
    @IBOutlet weak var searchBtn: UIButton!
   
    @IBOutlet weak var notificationBtn: UIButton!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    @IBOutlet weak var prepaidChecbox: UIButton!
    
    @IBOutlet weak var postpaidCheckbox: UIButton!
    
    @IBOutlet weak var rechargBtn: UIButton!
    
    var myPickerView : UIPickerView!
    
    var toolBar = UIToolbar()
    
    var pickerData = ["Hitesh Modi" , "Kirit Modi" , "Ganesh Modi" , "Paresh Modi"]
    
    var pickerData1 = ["madhu" , "babu" , "mani" , "naveen"]
    
    var pickerSample = Array<String>()
    
    var selectedTextField:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
        
        networkField.delegate = self
        
        planField.delegate = self
        
        networkField.tag = 1
        planField.tag = 2
        
        mobileField.layer.borderWidth = 0.5
        mobileField.layer.borderColor = UIColor.lightGray.cgColor
        mobileField.layer.cornerRadius = 3
        
        networkField.layer.borderWidth = 0.5
        networkField.layer.borderColor = UIColor.lightGray.cgColor
        networkField.layer.cornerRadius = 3
        
        planField.layer.borderWidth = 0.5
        planField.layer.borderColor = UIColor.lightGray.cgColor
        planField.layer.cornerRadius = 3
        
        
//        rechargBtn.backgroundColor = hexStringToUIColor(hex: "#5f1a58")
//        
//        rechargBtn.backgroundColor = hexStringToUIColor(hex: "#8d2029")
//        
//        rechargBtn.layer.cornerRadius = 5
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //        headerView.isHidden = false
        
        self.tabBarController?.tabBar.isHidden = true
        
        super.viewDidAppear(true)
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
            
            pickerSample = pickerData
            
            networkField.tag = 1
            
            self.pickUp(networkField)
            
            myPickerView.reloadAllComponents()
            myPickerView.selectRow(0, inComponent: 0, animated: false)
            
            
        }
            
        else if textField == planField {
            
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
        
        return pickerSample.count
        
        //        if (pickerView.tag == 1){
        //
        //            return pickerData.count
        //
        //        }else{
        //
        //            return pickerData1.count
        //        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        //        if (pickerView.tag == 1){
        //
        //            return "\(pickerData[row])"
        //
        //        }else{
        //
        //            return "\(pickerData1[row])"
        //        }
        return pickerSample[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        if (selectedTextField == 1){
            
            self.networkField.text = pickerSample[row]
            
        }else if(selectedTextField == 2){
            
            self.planField.text = pickerSample[row]
        }
        
    }
    
    
    @IBAction func rechargeAction(_ sender: Any) {
        
        let rechargeViewController = self.storyboard?.instantiateViewController(withIdentifier: "PayzAppViewController") as! PayzAppViewController
        self.navigationController?.pushViewController(rechargeViewController, animated: true)

    }
    
    @IBAction func indexChage(_ sender: Any) {
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            postPaidView.isHidden = true
            prepaidView.isHidden = false
        case 1:
            postPaidView.isHidden = false
            prepaidView.isHidden = true
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
            
            postpaidCheckbox.isSelected = false
        }
        else
        {
            postpaidCheckbox.setBackgroundImage(UIImage(named: "selectedBox"), for: UIControlState.normal)
            prepaidChecbox.setBackgroundImage(UIImage(named: "unselectedBox"), for: UIControlState.normal)
            
            
            postpaidCheckbox.isSelected = true
        }
        
    }
    
    @IBAction func postpiadChecboxAction(_ sender: UIButton) {
        
        //        postpaidCheckbox.setBackgroundImage(UIImage(named: "selectedBox"), for: .selected)
        //        prepaidChecbox.setBackgroundImage(UIImage(named: "unselectedBox"), for: .normal)
        
        //        sender.isSelected = !sender.isSelected
        
        if (postpaidCheckbox.isSelected == true)
        {
            postpaidCheckbox.setBackgroundImage(UIImage(named: "unselectedBox"), for: UIControlState.normal)
            prepaidChecbox.setBackgroundImage(UIImage(named: "selectedBox"), for: UIControlState.normal)
            
            postpaidCheckbox.isSelected = false
        }
        else
        {
            postpaidCheckbox.setBackgroundImage(UIImage(named: "selectedBox"), for: UIControlState.normal)
            prepaidChecbox.setBackgroundImage(UIImage(named: "unselectedBox"), for: UIControlState.normal)
            
            
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
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        contacts.forEach { contact in
            for number in contact.phoneNumbers {
                let phoneNumber = number.value
                print("number is = \(phoneNumber)")
                
                mobileField.text = phoneNumber.stringValue
                
                
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
    
    @IBAction func phoneBookAction(_ sender: Any) {
        
        
        let cnPicker = CNContactPickerViewController()
        cnPicker.delegate = self
        self.present(cnPicker, animated: true, completion: nil)
        
    }
    


}



//
//  LandlineViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 13/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
import ContactsUI

class LandlineViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate,CNContactPickerDelegate {
    
    
    @IBOutlet weak var operatorField: UITextField!
    
    @IBOutlet weak var stdNumField: UITextField!
    
    @IBOutlet weak var circleField: UITextField!
    
    @IBOutlet weak var amountField: UITextField!
    
    @IBOutlet weak var addressBookBtn: UIButton!

    @IBOutlet weak var rechargeBtn: UIButton!
    
    @IBOutlet weak var offersView: UIView!
    
    var myPickerView : UIPickerView!
    
    var toolBar = UIToolbar()
    
    var pickerData = ["Operator1" , "Operator2" , "Operator3" , "Operator4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        rechargeBtn.backgroundColor = hexStringToUIColor(hex: "#5f1a58")
//        
//        rechargeBtn.backgroundColor = hexStringToUIColor(hex: "#8d2029")
//        
//        rechargeBtn.layer.cornerRadius = 5
        
        operatorField.delegate = self
        
        stdNumField.keyboardType = .phonePad
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
        
        
        self.pickUp(operatorField)
        
        operatorField = textField
        
    }
    
    //MARK:- PickerView Delegate & DataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerData.count
        
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.operatorField.text = pickerData[row]
        
    }
    
    //MARK:- CNContactPickerDelegate Method
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        contacts.forEach { contact in
            for number in contact.phoneNumbers {
                let phoneNumber = number.value
                print("number is = \(phoneNumber)")
                
                stdNumField.text = phoneNumber.stringValue
                
                
            }
            
            let cnContacts = [CNContact]()
            
            for contact in cnContacts {
                let fullName = CNContactFormatter.string(from: contact, style: .fullName) ?? "No Name"
                print("\(fullName): \(contact.phoneNumbers.description)")
            }
        }
    }

    
    @IBAction func addressBookAction(_ sender: Any) {
        
        let cnPicker = CNContactPickerViewController()
        cnPicker.delegate = self
        self.present(cnPicker, animated: true, completion: nil)
    }

    @IBAction func rechargeAction(_ sender: Any) {
    }
   
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func searchAction(_ sender: Any) {
    }
    
    @IBAction func notificationAction(_ sender: Any) {
    }
    

}

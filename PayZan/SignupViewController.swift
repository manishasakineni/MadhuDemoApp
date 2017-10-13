//
//  SignupViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 05/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController,UITextFieldDelegate,UITabBarControllerDelegate,UITabBarDelegate {
    
    
    @IBOutlet weak var mobileNumField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var paswdField: UITextField!
    
    @IBOutlet weak var headerView: UIView!
    
    let serviceController = ServiceController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tabBarController?.delegate = self
        
        mobileNumField.delegate = self
        emailField.delegate = self
        paswdField.delegate = self
        
        mobileNumField.maxLength = 13
        mobileNumField.keyboardType = .phonePad

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Touch and TextFieldShouldReturn Functions
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        //        self.view.endEditing(true)
        return true
    }
    
    
    // BUtoons Actions
    
    @IBAction func signUpAction(_ sender: Any) {
        
        
        if (self.mobileNumField.text?.isEmpty)! {
            
            let alertController = UIAlertController(title: "Message", message: "Please Enter Your Mobile Number" , preferredStyle: UIAlertControllerStyle.alert)
            
            let DestructiveAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
            }
            alertController.addAction(DestructiveAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else if (self.paswdField.text?.isEmpty)! {
            
            let alertController = UIAlertController(title: "Message", message: "Please Enter Your Password" , preferredStyle: UIAlertControllerStyle.alert)
            
            let DestructiveAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
            }
            alertController.addAction(DestructiveAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        
        else {
            
//            if pword.isValidPassword == false {
//                
//                print("isValidPassword")
//            }
//            let email1:String = emailField.text!
//            
//            let isEmailAddressValid = isValidEmailAddress(emailAddressString: email1)
            
//            if isEmailAddressValid
//            {
//                print("Email address is valid")
            
                let mNumber:String = mobileNumField.text!
                let pword:String = paswdField.text!
                let email:String = emailField.text!
                
                
                
                let  strUrl = registerUrl
                
                let dictParams = ["MobileNumber":mNumber,"Password":pword,"Email":email,"RoleId":nil] as NSDictionary
                
                print("dic params \(dictParams)")
                //CleverTap.sharedInstance()?.onUserLogin(dictParams as! [AnyHashable : Any])
                let dictHeaders = ["":"","":""] as NSDictionary
                
                serviceController.requestPOSTURL(strURL: strUrl as NSString, postParams: dictParams, postHeaders: dictHeaders, successHandler:{(result) in
                    DispatchQueue.main.async()
                        {
                            
                            let respVO:SignupVo = Mapper().map(JSONObject: result)!
                            
                            print("responseString = \(respVO)")
                            
                            let statusCode = respVO.StatusCode
                            
                            print("StatusCode:\(String(describing: statusCode))")
                            
                            //                        print("result:\(result)")
                            //
                            //                        let strStatusCode = result.value(forKey: "StatusCode") as! Int
                            //                        print("strStatusCode",strStatusCode)
                            
                            if statusCode == 200
                            {
                                
                                
                                //                            let dataObj =  result.value(forKey: "StatusMessage") as! String
                                //
                                //                            print("dataObj:",dataObj)
                                
                                
                                let statusMsg  = respVO.StatusMessage!
                                
                                print("statusMsg:\(String(describing: statusMsg))")
                                
                                let alertController = UIAlertController(title: "", message: statusMsg , preferredStyle: UIAlertControllerStyle.alert)
                                
                                let DestructiveAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                                }
                                alertController.addAction(DestructiveAction)
                                self.present(alertController, animated: true, completion: nil)
                                
                            }
                            else if statusCode == 401{
                                
                                let alertController = UIAlertController(title: "", message: "error" , preferredStyle: UIAlertControllerStyle.alert)
                                
                                let DestructiveAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                                }
                                alertController.addAction(DestructiveAction)
                                self.present(alertController, animated: true, completion: nil)
                                
                                
                            }
                            else if statusCode == nil{
                                
                                let s1 = "Your mobile number"
                                let s2 = mNumber
                                let s3 = "is already taken."
                                
                                let errMsg = s1 + " " + s2 + " " + s3
                                
                                let alertController = UIAlertController(title: "", message: errMsg , preferredStyle: UIAlertControllerStyle.alert)
                                
                                let DestructiveAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                                }
                                alertController.addAction(DestructiveAction)
                                self.present(alertController, animated: true, completion: nil)
                                
                                
                            }
                            else
                            {
                                //                            self.view.makeToast(result.value(forKey:"statusMessage") as! String, duration:kToastDuration, position:CSToastPositionCenter)
                                
                                //                            let alertController = UIAlertController(title: "", message: result.value(forKey:"statusMessage") as? String , preferredStyle: UIAlertControllerStyle.alert)
                                
                                let alertController = UIAlertController(title: "Success", message: "Network Error" , preferredStyle: UIAlertControllerStyle.alert)
                                
                                let DestructiveAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                                }
                                alertController.addAction(DestructiveAction)
                                self.present(alertController, animated: true, completion: nil)
                                
                            }
                    }
                }, failureHandler: {(error) in
                    
                    print("error")
                })

                
                
//            } else {
//                print("Email address is not valid")
//                
//                displayAlertMessage(messageToDisplay: "Email address is not valid")
//            }
        
            
        }
        
    }

    @IBAction func loginAction(_ sender: Any) {
        
        
        
    }
    
    @IBAction func facebookAction(_ sender: Any) {
    }
    
    @IBAction func googleAction(_ sender: Any) {
    }
    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    func displayAlertMessage(messageToDisplay: String)
    {
        let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
            
        }
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
    }
}
extension String {
    
    //To check text field or String is blank or not
    var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed.isEmpty
        }
    }
    
    //Validate Email
    
    var isEmail: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
        } catch {
            return false
        }
    }
    
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
    //validate Password
    var isValidPassword: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[a-zA-Z_0-9\\-_,;.:#+*?=!§$%&/()@]+$", options: .caseInsensitive)
            if(regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil){
                
                if(self.characters.count>=6 && self.characters.count<=20){
                    return true
                }else{
                    return false
                }
            }else{
                return false
            }
        } catch {
            return false
        }
    }
}

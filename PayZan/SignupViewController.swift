//
//  SignupViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 05/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class SignupViewController: BaseViewController,UITextFieldDelegate,UITabBarControllerDelegate,UITabBarDelegate {
    
    
    @IBOutlet weak var mobileNumField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var paswdField: UITextField!
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var eyeBtn: UIButton!
    
    @IBOutlet weak var signupBtn: UIButton!
    
    let serviceController = ServiceController()
    
//    var appDelegate = AppDelegate()
    
    @IBOutlet weak var facebookBtn: UIButton!
    
    @IBOutlet weak var googleBtn: UIButton!
    
    @IBOutlet weak var confirmPasswordField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mobileNumField.layer.borderWidth = 0.5
        mobileNumField.layer.borderColor = UIColor.lightGray.cgColor
        mobileNumField.layer.cornerRadius = 3
        mobileNumField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        paswdField.layer.borderWidth = 0.5
        paswdField.layer.borderColor = UIColor.lightGray.cgColor
        paswdField.layer.cornerRadius = 3
        paswdField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        emailField.layer.borderWidth = 0.5
        emailField.layer.borderColor = UIColor.lightGray.cgColor
        emailField.layer.cornerRadius = 3
        emailField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        confirmPasswordField.layer.borderWidth = 0.5
        confirmPasswordField.layer.borderColor = UIColor.lightGray.cgColor
        confirmPasswordField.layer.cornerRadius = 3
        confirmPasswordField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        self.tabBarController?.delegate = self
        
        mobileNumField.delegate = self
        emailField.delegate = self
        paswdField.delegate = self
        
        mobileNumField.maxLength = 13
        mobileNumField.keyboardType = .phonePad
        
//        signupBtn.backgroundColor = hexStringToUIColor(hex: "#5f1a58")
//        
//        signupBtn.backgroundColor = hexStringToUIColor(hex: "#8d2029")
//        
//        signupBtn.layer.cornerRadius = 5
        
        facebookBtn.layer.cornerRadius = 3
        googleBtn.layer.cornerRadius = 3

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
    
    func postSignUpService(){
        
        let null = NSNull()
        
        let mNumber:String = mobileNumField.text!
        let pword:String = paswdField.text!
        let email:String = emailField.text!
        
        print("email:\(email)")
        
        let  strUrl = registerUrl
        
        
        let dictParams = ["MobileNumber":mNumber,"Password":pword,"ConfirmPassword":pword,"Email":email,"RoleId":null] as NSDictionary
        
        print("dic params \(dictParams)")
        //CleverTap.sharedInstance()?.onUserLogin(dictParams as! [AnyHashable : Any])
        let dictHeaders = ["":"","":""] as NSDictionary
        
        serviceController.requestPOSTURL(strURL: strUrl as NSString, postParams: dictParams, postHeaders: dictHeaders, successHandler:{(result) in
            DispatchQueue.main.async()
                {
                    
                    let respVO:SignupVo = Mapper().map(JSONObject: result)!
                    
                    print("responseString = \(respVO)")
                    
                    let statusCode = respVO.IsSuccess
                    
                    print("StatusCode:\(String(describing: statusCode))")
                    
                    
                    if statusCode == true
                    {
                        
                        
                        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "TabsViewController") as! UITabBarController
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        appDelegate.window?.rootViewController = viewController
                        
//                        let statusMsg  = respVO.StatusMessage!
                        
//                        print("statusMsg:\(String(describing: statusMsg))")
                        
                        let alertController = UIAlertController(title: "Alert", message: "User registered successfully" , preferredStyle: UIAlertControllerStyle.alert)
                        
                        let DestructiveAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                        }
                        alertController.addAction(DestructiveAction)
                        self.present(alertController, animated: true, completion: nil)
                        
                        
                    }
                    else if statusCode == false{
                        
                        let alertController = UIAlertController(title: "", message: "Network error" , preferredStyle: UIAlertControllerStyle.alert)
                        
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
        
    }
    func validateAllFields() -> Bool
    {
        mobileNumField.text=mobileNumField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        paswdField.text=paswdField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        emailField.text=emailField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        
        //        txtPersonalEmail.text=txtPersonalEmail.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        confirmPasswordField.text=confirmPasswordField.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        
        let mnumb:NSString = mobileNumField.text! as NSString
        let pasword:NSString = paswdField.text! as NSString
        let emailId:NSString = emailField.text! as NSString
        let confirmPassword:NSString = confirmPasswordField.text! as NSString
        
        
        //Check whether textField are left empty or not
        var errorMessage:NSString?
        
        if (mnumb.length<=0) {
            errorMessage=GlobalSupportingClass.blankPhoneNumberErrorMessage() as String as String as NSString?
        }
        else if (mnumb.length<=9) {
            errorMessage=GlobalSupportingClass.invalidPhoneNumberErrorMessage() as String as String as NSString?
        }
//        else if(!GlobalSupportingClass.phoneValidate(value: mnumb as String)) {
//            errorMessage=GlobalSupportingClass.phoneValidateMessage() as String as String as NSString?
//        }
        else if (emailId.length<=0) {
            errorMessage=GlobalSupportingClass.blankEmailIDErrorMessage() as String as String as NSString?
        }
        else if (emailId.length<=3) {
            errorMessage=GlobalSupportingClass.miniCharEmailIDErrorMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.isValidEmail(emailId as NSString))
        {
            errorMessage=GlobalSupportingClass.invalidEmaildIDFormatErrorMessage() as String as String as NSString?
        }
            
        else if (pasword.length<=0) {
            errorMessage=GlobalSupportingClass.blankPasswordErrorMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.capitalOnly(password: pasword as String)) {
            
            errorMessage=GlobalSupportingClass.capitalLetterMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.numberOnly(password: pasword as String)) {
            
            errorMessage=GlobalSupportingClass.numberMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.specialCharOnly(password: pasword as String)) {
            
            errorMessage=GlobalSupportingClass.specialCharacterMessage() as String as String as NSString?
        }
            
        else if(confirmPassword.length<=0){
            errorMessage=GlobalSupportingClass.blankConfirmPasswordErrorMessage() as String as String as NSString?
        }
       
        else if(pasword.length<5||confirmPassword.length<5)
        {
            errorMessage = GlobalSupportingClass.invalidDigitsInPasswordErrorMessage() as String as String as NSString?
        }
        else if(!pasword.isEqual(to: confirmPassword as String)){
            errorMessage=GlobalSupportingClass.passwordMissMatchErrorMessage() as String as String as NSString?
        }
       
        
        
        if let errorMsg = errorMessage{
            
            self.showAlertViewWithTitle("Alert", message: errorMsg as String, buttonTitle: "Retry")
            return false;
        }
        return true
    }

    
    // BUtoons Actions
    
    @IBAction func signUpAction(_ sender: Any) {
        
        
        if self.validateAllFields()
        {
            if(appDelegate.checkInternetConnectivity()){
                
                postSignUpService()
            }
            else {
                
                self.appDelegate.window?.makeToast("The Internet connection appears to be offline. Please connect to the internet", duration:kToastDuration, position:CSToastPositionCenter)
                return
                
            }
            
        }
        
        
    }

    @IBAction func loginAction(_ sender: Any) {
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = viewController
        
    }
    
    @IBAction func facebookAction(_ sender: Any) {
    }
    
    @IBAction func googleAction(_ sender: Any) {
    }
    
    @IBAction func backAction(_ sender: Any) {
        
//        self.navigationController?.popViewController(animated: true)
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = viewController
    }
    
    @IBAction func eyeAction(_ sender: Any) {
        
        if eyeBtn.tag == 0
        {
            paswdField.isSecureTextEntry = false
            eyeBtn.tag = 1
        }
            
        else
            
        {
            paswdField.isSecureTextEntry = true
            eyeBtn.tag = 0
            
            
        }
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
    
        func isEqualToString(find: String) -> Bool {
            return String(format: self) == find
        }
    
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

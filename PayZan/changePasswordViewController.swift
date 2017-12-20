//
//  changePasswordViewController.swift
//  PayZan
//
//  Created by Manoj on 05/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class changePasswordViewController: BaseViewController,UITextFieldDelegate,UITabBarControllerDelegate {
    
    //MARK:- OutLets


    @IBOutlet weak var eyebtnOutLet: UIButton!
    
    @IBOutlet weak var currentPswdTF: UITextField!
    
    @IBOutlet weak var newpswdOutLet: UITextField!
    
    
    @IBOutlet weak var reTypeNewPswdOutLet: UITextField!
    
    @IBOutlet weak var newpswdeyebtnOutlet: UIButton!
    
    
    @IBOutlet weak var retypePswdOutLet: UIButton!
    
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- TextField Colors

        
        currentPswdTF.layer.borderWidth = 0.5
        currentPswdTF.layer.borderColor = UIColor.lightGray.cgColor
        currentPswdTF.layer.cornerRadius = 3
        currentPswdTF.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        newpswdOutLet.layer.borderWidth = 0.5
        newpswdOutLet.layer.borderColor = UIColor.lightGray.cgColor
        newpswdOutLet.layer.cornerRadius = 3
        newpswdOutLet.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        reTypeNewPswdOutLet.layer.borderWidth = 0.5
        reTypeNewPswdOutLet.layer.borderColor = UIColor.lightGray.cgColor
        reTypeNewPswdOutLet.layer.cornerRadius = 3
        reTypeNewPswdOutLet.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        
        
        self.tabBarController?.delegate = self
        
        currentPswdTF.delegate = self
        newpswdOutLet.delegate = self
        reTypeNewPswdOutLet.delegate = self
        

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
    
    //MARK:- Button Action

    
    @IBAction func backAction(_ sender: Any) {
        
         self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:- postLoginService

    
    func postLoginService(){
        
        let  strUrl = loginUrl
        
        let mobileNumber:String = currentPswdTF.text!
        let pword:String = newpswdOutLet.text!
        
        
        let dictParams = ["userName":mobileNumber,"password":pword] as NSDictionary
        
        print("dic params \(dictParams)")
        
        let dictHeaders = ["":"","":""] as NSDictionary
        
        
        serviceController.requestPOSTURL(strURL: strUrl as NSString, postParams: dictParams, postHeaders: dictHeaders, successHandler:{(result) in
            DispatchQueue.main.async()
                {
                    
                    print("result:\(result)")
                    
                    let respVO:LoginResultVo = Mapper().map(JSONObject: result)!
                    
                    
                    print("responseString = \(respVO)")
                    
                    
                    let isSuccess = respVO.IsSuccess
                    
                    print("StatusCode:\(String(describing: isSuccess))")
                    
                    
                    if isSuccess == true
                    {
                        
                        let userId = respVO.Result?.Roles?[0].UserId
                        
                        let walletId = respVO.Result?.UserWallet?.WalletId
                        
                        print("userId:\(String(describing: userId))")
                        print("walletId:\(String(describing: walletId))")
                        
                        let accessTokenn = respVO.Result?.AccessToken
                        let tokenTypee = respVO.Result?.TokenType
                        
                        let walletAmount = respVO.Result?.UserWallet?.Balance
                        
                        let uName  = respVO.Result?.User?.UserName
                        
                        let emailId = respVO.Result?.User?.Email
                        
                        print("uName:\(String(describing: uName))")
                        
                        let defaults = UserDefaults.standard
                        
                        // Save String value to UserDefaults
                        
                        defaults.set(uName, forKey: uNamee)
                        
                        defaults.set(emailId, forKey: emailIdd)
                        
                        defaults.set(walletAmount, forKey: walletAmountt)
                        
                        defaults.set(userId, forKey: userIDD)
                        
                        defaults.set(walletId, forKey: walletIDD)
                        
                        defaults.set(accessTokenn, forKey: accessToken)
                        defaults.set(tokenTypee, forKey: tokenType)
                        
                        UserDefaults.standard.synchronize()
                        
                        
                        UserDefaults.standard.setValue("true", forKey: kIsFirstTime)
                        UserDefaults.standard.synchronize()
                        
                        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "TabsViewController") as! UITabBarController
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        appDelegate.window?.rootViewController = viewController
                        
                        
                        
                    }
                    else if isSuccess == false {
                        
                        //                        let inValidMsg = GlobalSupportingClass.invalidLoginMessage()
                        
                        let invalidmsg = respVO.EndUserMessage
                        
                        //      self.showAlertViewWithTitle("Alert", message: invalidmsg!, buttonTitle: "Retry")
                        
                    }
                        
                    else
                    {
                        
                        let inValidMsg = GlobalSupportingClass.invalidLoginMessage()
                        
                        //      self.showAlertViewWithTitle("Alert", message: inValidMsg as String, buttonTitle: "Retry")
                        
                    }
            }
        }, failureHandler: {(error) in
            
            
        })
    }
    
    
    //MARK:- validateAllFields

    
    func validateAllFields() -> Bool
    {
        currentPswdTF.text=currentPswdTF.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        newpswdOutLet.text=newpswdOutLet.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        
        let currenuPswd:NSString = currentPswdTF.text! as NSString
        let newPswd:NSString = newpswdOutLet.text! as NSString
        let reTypeNewPswd:NSString = reTypeNewPswdOutLet.text! as NSString
        
        
        var errorMessage:NSString?
        
        if (currenuPswd.length<=0) {
            errorMessage=GlobalSupportingClass.changePasswordErrorMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.capitalOnly(password: currenuPswd as String)) {
            
            errorMessage=GlobalSupportingClass.capitalLetterMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.numberOnly(password: currenuPswd as String)) {
            
            errorMessage=GlobalSupportingClass.numberMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.specialCharOnly(password: currenuPswd as String)) {
            
            errorMessage=GlobalSupportingClass.specialCharacterMessage() as String as String as NSString?
        }
            
        else if (newPswd.length<=0) {
            errorMessage=GlobalSupportingClass.newPasswordErrorMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.capitalOnly(password: newPswd as String)) {
            
            errorMessage=GlobalSupportingClass.capitalLetterMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.numberOnly(password: newPswd as String)) {
            
            errorMessage=GlobalSupportingClass.numberMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.specialCharOnly(password: newPswd as String)) {
            
            errorMessage=GlobalSupportingClass.specialCharacterMessage() as String as String as NSString?
        }
            
        else if(reTypeNewPswd.length<=0){
            errorMessage=GlobalSupportingClass.blankConfirmPasswordErrorMessage() as String as String as NSString?
        }
            
        else if(newPswd.length<5||reTypeNewPswd.length<5)
        {
            errorMessage = GlobalSupportingClass.invalidDigitsInPasswordErrorMessage() as String as String as NSString?
        }
        else if(!newPswd.isEqual(to: reTypeNewPswd as String)){
            errorMessage=GlobalSupportingClass.passwordMissMatchErrorMessage() as String as String as NSString?
        }
        
        
        
        if let errorMsg = errorMessage{
            
            self.showAlertViewWithTitle("Alert", message: errorMsg as String, buttonTitle: "Retry")
            return false;
        }
        return true
    }
    

    //MARK:- Button Action

   
    @IBAction func eyebtnclicked(_ sender: Any) {
        
        if eyebtnOutLet.tag == 0
        {
            currentPswdTF.isSecureTextEntry = false
            eyebtnOutLet.tag = 1
        }
            
        else
            
        {
            currentPswdTF.isSecureTextEntry = true
            eyebtnOutLet.tag = 0
            
            
        }

        
    }
    
    
    @IBAction func newPswdAction(_ sender: Any) {
        
        if newpswdOutLet.tag == 0
        {
            newpswdOutLet.isSecureTextEntry = false
            newpswdOutLet.tag = 1
        }
            
        else
            
        {
            newpswdOutLet.isSecureTextEntry = true
            newpswdOutLet.tag = 0
            
            
        }

        
        
        
    }
    
    
    @IBAction func reTypePswdAction(_ sender: Any) {
        
        if retypePswdOutLet.tag == 0
        {
            reTypeNewPswdOutLet.isSecureTextEntry = false
            retypePswdOutLet.tag = 1
        }
            
        else
            
        {
            currentPswdTF.isSecureTextEntry = true
            reTypeNewPswdOutLet.tag = 0
            
            
        }

    }
    
    
    
    
    @IBAction func changePswdAction(_ sender: Any) {
        
        if self.validateAllFields(){
            
            if(appDelegate.checkInternetConnectivity()){
                
                postLoginService()
                
            }
            else{
                appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
                return
            }
            
        }
    }
    

        
    }
    
   


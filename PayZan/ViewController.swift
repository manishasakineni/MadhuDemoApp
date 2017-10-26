//
//  ViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 04/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Google
import GoogleSignIn

//let reachability = Reachability()!

class ViewController: BaseViewController,UITextFieldDelegate,GIDSignInUIDelegate,GIDSignInDelegate,SWRevealViewControllerDelegate {
    
    @IBOutlet weak var barBtn: UIBarButtonItem!
    
    @IBOutlet weak var mobileField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var eyeBtnOutlet: UIButton!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var facebookBtn: UIButton!
    
    @IBOutlet weak var googleBtn: UIButton!
    
    
    var dict : [String : AnyObject]!
    
    let serviceController = ServiceController()
    

    override func viewDidLoad() {
        
//        self.revealViewController().delegate = self
        
        self.tabBarController?.tabBar.isHidden = true
        
//        headerView.isHidden = true
        
        mobileField.layer.borderWidth = 0.5
        mobileField.layer.borderColor = UIColor.lightGray.cgColor
        mobileField.layer.cornerRadius = 3
        mobileField.layer.masksToBounds = true
        mobileField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        passwordField.layer.borderWidth = 0.5
        passwordField.layer.borderColor = UIColor.lightGray.cgColor
        passwordField.layer.cornerRadius = 3
        passwordField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self as GIDSignInDelegate
        
        mobileField.delegate = self
        passwordField.delegate = self
        
//        loginBtn.backgroundColor = hexStringToUIColor(hex: "#5f1a58")
//        
//        loginBtn.backgroundColor = hexStringToUIColor(hex: "#8d2029")
//        
//        loginBtn.layer.cornerRadius = 5
        
        facebookBtn.layer.cornerRadius = 3
        googleBtn.layer.cornerRadius = 3
        
        
        
//        mobileField.layer.cornerRadius = 5.0
//        passwordField.layer.cornerRadius = 5.0
        
        sideMenus()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
//        headerView.isHidden = false
        
        self.tabBarController?.tabBar.isHidden = true
        
        super.viewDidAppear(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
       // self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.tabBarController?.tabBar.isHidden = false
        // Show the navigation bar on other view controllers
       // self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        //        self.view.endEditing(true)
        return true
    }
    
    func sideMenus(){
        
        if revealViewController() != nil {
            
            barBtn.target = revealViewController()
            barBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            //  revealViewController() .rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 275
            
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
    }
    
    func postLoginService(){
        
        let  strUrl = loginUrl
        
        let mobileNumber:String = mobileField.text!
        let pword:String = passwordField.text!
        
        
        let dictParams = ["userName":mobileNumber,"password":pword] as NSDictionary
        
        print("dic params \(dictParams)")
        
        let dictHeaders = ["":"","":""] as NSDictionary
        
        serviceController.requestPOSTURL(strURL: strUrl as NSString, postParams: dictParams, postHeaders: dictHeaders, successHandler:{(result) in
            DispatchQueue.main.async()
                {
                    
                    print("result:\(result)")
                    
                    let respVO:LoginVo = Mapper().map(JSONObject: result)!
                    
                    
                    print("responseString = \(respVO)")
                    
                    
                    let statusCode = respVO.StatusCode
                    
                    print("StatusCode:\(String(describing: statusCode))")
                    
                    //                        let strStatusCode = result.value(forKey: "StatusCode") as! Int
                    //                        print("strStatusCode",strStatusCode)
                    
                    if statusCode == 200
                    {
                        
                        let userId = respVO.data?.UserWallet?.UserId
                        
                        let walletId = respVO.data?.UserWallet?.WalletId
                        
                        let defaults = UserDefaults.standard
                        
                        // Save String value to UserDefaults
                        // Using defaults.set(value: Any?, forKey: String)
                        defaults.set(userId, forKey: "userIDD")
                        
                        defaults.set(walletId, forKey: "walletIDD")
                        
                        print("roleId:\(String(describing: userId))")
                        
                        let resObj:UserVo  = respVO.data!
                        
                        let uName = resObj.User?.UserName
                        
                        print("uName:\(String(describing: uName))")
                        
                        //                            let dataObj =   (result.value(forKey: "data") as! NSDictionary) as! [String : AnyObject]
                        //                            print("dataObj:",dataObj)
                        
                        UserDefaults.standard.setValue("true", forKey: kIsFirstTime)
                        UserDefaults.standard.synchronize()
                        
                        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "TabsViewController") as! UITabBarController
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        appDelegate.window?.rootViewController = viewController
                        
                        
                        
                    }
                    else if statusCode == 401{
                        
                        let alertController = UIAlertController(title: "", message: "Mobile/Email or Password is incorrect" , preferredStyle: UIAlertControllerStyle.alert)
                        
                        let DestructiveAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                        }
                        alertController.addAction(DestructiveAction)
                        self.present(alertController, animated: true, completion: nil)
                        
                        
                    }
                        
                    else
                    {
                        //                            self.view.makeToast(result.value(forKey:"statusMessage") as! String, duration:kToastDuration, position:CSToastPositionCenter)
                        
                        //                            let alertController = UIAlertController(title: "", message: result.value(forKey:"statusMessage") as? String , preferredStyle: UIAlertControllerStyle.alert)
                        
                        let alertController = UIAlertController(title: "", message: "Mobile/Email or Password is incorrect" , preferredStyle: UIAlertControllerStyle.alert)
                        
                        let DestructiveAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                        }
                        alertController.addAction(DestructiveAction)
                        self.present(alertController, animated: true, completion: nil)
                        
                    }
            }
        }, failureHandler: {(error) in
        })
    }
    

    @IBAction func loginBtnAction(_ sender: Any) {
        
        
        
        if(appDelegate.checkInternetConnectivity()){
            
            if (self.mobileField.text?.isEmpty)! {
                
                let alertController = UIAlertController(title: "Message", message: "Please Enter Your Mobile Number or Email" , preferredStyle: UIAlertControllerStyle.alert)
                
                let DestructiveAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                }
                alertController.addAction(DestructiveAction)
                self.present(alertController, animated: true, completion: nil)
                
            }
            else if (self.passwordField.text?.isEmpty)! {
                
                let alertController = UIAlertController(title: "Message", message: "Please Enter Your Password" , preferredStyle: UIAlertControllerStyle.alert)
                
                let DestructiveAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                }
                alertController.addAction(DestructiveAction)
                self.present(alertController, animated: true, completion: nil)
                
                
            }else {
                
                postLoginService()
            }
            
           
        }
        else{
//             if {
//                self.appDelegate.window?.makeToast("No internet connection..!", duration:kToastDuration, position:CSToastPositionBottom)
////                self.movetosignUpPage()
//            }else{
                self.appDelegate.window?.makeToast("The Internet connection appears to be offline. Please connect to the internet", duration:kToastDuration, position:CSToastPositionCenter)
                return
//            }
        }
        
//        if reachability.isReachable == true{
//            
//             appDelegate.window?.makeToast(kNetworkStatusMessage, duration: kToastDuration, position: CSToastPositionCenter)
//        }
        
        
    }

    @IBAction func fbBtnAction(_ sender: Any) {
        
        
        MBProgressHUD.showAdded(to:appDelegate.window,animated:true)
        
        MBProgressHUD.hide(for:appDelegate.window,animated:true)
        
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if fbloginresult.grantedPermissions != nil {
                    if(fbloginresult.grantedPermissions.contains("email"))
                    {
                        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        UserDefaults.standard.setValue("true", forKey: kIsFirstTime)
                        UserDefaults.standard.synchronize()
                        
                        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "TabsViewController") as! UITabBarController
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        appDelegate.window?.rootViewController = viewController
                        
                        self.getFBUserData()
                        
                        //                        fbLoginManager.logOut()
                    }
                    
                }
            }
        }
        
    }
    
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    print(result!)
                    
                    print(self.dict)
                    
                    let json = result as! [String : Any]
                    
                    if json["first_name"] != nil {
                        
                        let name = json["first_name"]
                        
                        print("name:\(String(describing: name))")
                    }
                
                    
                }
            })
        }
       
    }
    
    @IBAction func gmailBtnAction(_ sender: Any) {
        
        MBProgressHUD.showAdded(to:appDelegate.window,animated:true)
        
        
       GIDSignIn.sharedInstance().signIn()
        
        
    }
    
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        
        MBProgressHUD.hide(for:appDelegate.window,animated:true)
    }
    
    // Present a view that prompts the user to sign in with Google
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
    
   
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
//        if error != nil{
//            print(error ?? "google error")
//            return
//        }
        if (error == nil)
        {
            
        if UIDevice.current.userInterfaceIdiom == .phone {
            //            if UserDefaults.standard.bool(forKey: "checkLogin") {
            
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            let profileUrl = user.profile.imageURL(withDimension: 200)
            //            let mobile = user.profile.
            
            
            print("fullName:\(String(describing: fullName))")
            print("givenName:\(String(describing: givenName))")
            print("email:\(String(describing: email))")
            print("profileUrl:\(String(describing: profileUrl))")
            
            UserDefaults.standard.setValue("true", forKey: kIsFirstTime)
            UserDefaults.standard.synchronize()
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "TabsViewController") as! UITabBarController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = viewController
            
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            appDelegate.window?.rootViewController = homeView
//            
//            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "TabsViewController") as! UITabBarController
            
            
//            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            
           // MBProgressHUD.hide(for:appDelegate.window,animated:true)
        }
        else if UIDevice.current.userInterfaceIdiom == .pad {
            
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            //            let mobile = user.profile.
            
            
            print("fullName:\(String(describing: fullName))")
            print("givenName:\(String(describing: givenName))")
            print("email:\(String(describing: email))")
            
            UserDefaults.standard.setValue("true", forKey: kIsFirstTime)
            UserDefaults.standard.synchronize()
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "TabsViewController") as! UITabBarController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = viewController
            
           // MBProgressHUD.hide(for:appDelegate.window,animated:true)
        }
        }
        else {
        Thread.sleep(forTimeInterval: 1.0)
        var configureError: Error?
        //    [[GGLContext sharedInstance] configureWithError:&configureError];
        assert(configureError == nil, "Error configuring Google services: \(String(describing: configureError))")
        GIDSignIn.sharedInstance().delegate = self as GIDSignInDelegate
            
        }
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        
//        headerView.isHidden = false
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signupBtnAction(_ sender: Any) {
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = viewController
        
    }
    
    @IBAction func eyeBtnAction(_ sender: Any) {
        
        if eyeBtnOutlet.tag == 0
        {
            passwordField.isSecureTextEntry = false
            eyeBtnOutlet.tag = 1
        }
            
        else
            
        {
            passwordField.isSecureTextEntry = true
            eyeBtnOutlet.tag = 0
            
            
        }
    }
    
    
}


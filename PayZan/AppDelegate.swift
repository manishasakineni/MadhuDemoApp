//
//  AppDelegate.swift
//  PayZan
//
//  Created by CalibrageMac02 on 04/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import FBSDKLoginKit
import FacebookCore
import Google
import GoogleSignIn
import FBSDKLoginKit
import SystemConfiguration
import Localize

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,GIDSignInDelegate,SWRevealViewControllerDelegate {
    
    var tabController = TabsViewController()
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
    }

    var window: UIWindow?

let tabBarController = UITabBarController()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        let localize = Localize.shared
        // Set your localize provider.
        localize.update(provider: .json)
        // Set your file name
        localize.update(fileName: "lang")
        // Set your default languaje.
//        localize.update(defaultLanguage: "fr")
        // If you want change a user language, different to default in phone use thimethod.
        localize.update(language: "en")
        localize.update(defaultLanguage: "si")
        localize.update(defaultLanguage: "ta")
        // If you want remove storaged languaje use
        localize.resetLanguage()
        // The used language
        print(localize.language())
        // List of aviable languajes
        print(localize.availableLanguages())
        
        // Or you can use static methods for all
        
        Localize.update(fileName: "lang")
//        Localize.update(defaultLanguage: "fr")
        Localize.update(defaultLanguage: "si")
        Localize.update(defaultLanguage: "ta")
//        Localize.update(language: "en-DE")
        
        IQKeyboardManager.sharedManager().enable = true
        
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(String(describing: configureError))")
        
        GIDSignIn.sharedInstance().delegate = self as GIDSignInDelegate
        
        
//        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.window?.rootViewController = viewController
        
        
//        let tabViewController1 = HomeViewController(
//            nibName: "HomeViewController",
//            bundle: nil)
//        let tabViewController2 = ViewController(
//            nibName:"ViewController",
//            bundle: nil)
//        let tabViewController3 = AddMoneyWalletViewController(
//            nibName:"AddMoneyWalletViewController",
//            bundle: nil)
//        let tabViewController4 = OffersViewController(
//            nibName:"OffersViewController",
//            bundle: nil)
        
//                let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                let homeController = mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
////        let homeController = HomeViewController()
//        homeController.tabBarItem = UITabBarItem(
//            title: "Home",
//            image: UIImage(named: "homePng"),
//            tag: 0)
//        
////        let loginController = ViewController()
//        let loginController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        loginController.tabBarItem = UITabBarItem(
//            title: "Login",
//            image:UIImage(named: "myProfilePng") ,
//            tag:1)
//        
////        let addMoneyControllers = AddMoneyWalletViewController()
//        let addMoneyControllers = mainStoryboard.instantiateViewController(withIdentifier: "AddMoneyWalletViewController") as! AddMoneyWalletViewController
//        addMoneyControllers.tabBarItem =  UITabBarItem(
//            title: "Wallet",
//            image:UIImage(named: "addMoneyWalletPng") ,
//            tag:2)
//        
////        let offersControllers = OffersViewController()
//        let offersControllers = mainStoryboard.instantiateViewController(withIdentifier: "OffersViewController") as! OffersViewController
//        offersControllers.tabBarItem =  UITabBarItem(
//            title: "Offers",
//            image:UIImage(named: "offersPng") ,
//            tag:3)
//        
//        let viewControllerList = [homeController, loginController, addMoneyControllers, offersControllers]
//        tabController.viewControllers = viewControllerList
//        window?.rootViewController = tabController
        
//        tabController.viewControllers = viewControllerList.map { UINavigationController(rootViewController: $0) }
        
//        let controllers = [tabViewController1,tabViewController2,tabViewController3,tabViewController4]
//        
//        tabViewController1.tabBarItem = UITabBarItem(
//            title: "Home",
//            image: UIImage(named: "homePng"),
//            tag: 1)
//        tabViewController2.tabBarItem = UITabBarItem(
//            title: "Login",
//            image:UIImage(named: "myProfilePng") ,
//            tag:2)
//        tabViewController2.tabBarItem = UITabBarItem(
//            title: "Wallet",
//            image:UIImage(named: "addMoneyWalletPng") ,
//            tag:3)
//        tabViewController2.tabBarItem = UITabBarItem(
//            title: "Offers",
//            image:UIImage(named: "offersPng") ,
//            tag:4)
//
//        tabController.viewControllers = controllers
//        window?.rootViewController = tabBarController
//                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                    appDelegate.window?.rootViewController = tabBarController
       
        
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "TabsViewController") as! UITabBarController
        
//        viewController.tabBar.items?[1].image = UIImage(named: "search")?.withRenderingMode(.alwaysTemplate)
        viewController.tabBar.items?[1].title = "Login".localize(value: "Login")
//        viewController.tabBar.items?[1].selectedImage = UIImage(named: "search")?.withRenderingMode(.alwaysTemplate)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = viewController
        
     
//        self.tabController.tabBar.items![1].image = UIImage(named: "paySend")
//        // items![0] index of your tab bar item.items![0] means tabbar first item
//        
//        self.tabController.tabBar.items![1].selectedImage = UIImage(named: "paySend")
        
        
        
        
        
        
//        if UserDefaults.standard.object(forKey: kIsFirstTime) as? String == "true" {
//           
//        }else{
//            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            appDelegate.window?.rootViewController = viewController
//        }
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        FBSDKApplicationDelegate.sharedInstance().application(app, open: url, options: options)
        
        if #available(iOS 9.0, *) {
            GIDSignIn.sharedInstance().handle(url,sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        } else {
            // Fallback on earlier versions
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
        FBSDKAppEvents.activateApp()
        
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // MARK: - Check Internet Connectivity
    
    func checkInternetConnectivity() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    


}


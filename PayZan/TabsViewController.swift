//
//  TabsViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 25/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

enum TypeOfDay {
    case weekday
    case weekend
}
class TabsViewController: UITabBarController,UITabBarControllerDelegate {

    
    var typeOfDay: TypeOfDay = .weekday
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        
//        tabBarController?.viewControllers?.remove(at: 1)
//        tabbarController.viewControllers?.replaceRange()
        // Initial order is: WeekendVC, WeekdayVC, OtherVC
//        if let currentViewControllers = self.viewControllers {
//
//            let weekendVC = currentViewControllers[0]
//            let weekdayVC = currentViewControllers[1]
//            let otherVC = currentViewControllers[2]
//            let otherV = currentViewControllers[3]
//            
//            
//            switch typeOfDay {
//            case .weekend:
//                self.viewControllers = [weekendVC, otherVC]
//            case .weekday:
//                self.viewControllers = [weekdayVC, otherVC]
//            }
//        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        let addMoneyViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddMoneyWalletViewController") as! AddMoneyWalletViewController
        
        addMoneyViewController.indexValue = 1
        addMoneyViewController.isHiddenWithdrawView = false
        addMoneyViewController.isHiddenSendView = true
        addMoneyViewController.isHiddenTransactionView = true
        
        self.navigationController?.pushViewController(addMoneyViewController, animated: true)
        
        
        return true
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let index = tabBar.items?.index(of: item) else { return }
        print("the selected index is : \(index)")
        switch index {
        case 0:
            print("home")
            
            break
        case 1:
            print("profile")
            
//            tabBarController?.viewControllers?.remove(at: 1)
            
//            if ((tabBar.items?[1].title = "Login" as String) != nil){
//                
//                print("login")
            
//                let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
////                self.navigationController?.pushViewController(viewController, animated: true)
//                let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                appDelegate.window?.rootViewController = viewController
//            }
//            else {
//                print("profile")
//                
//            }
            
           
            break
        case 2:
            print("wallet")
            
            break
        case 3:
            print("offers")
            break
        default:
            print("default")
        }
        // Do something with the index
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController){
        switch tabBarController.selectedIndex {
        case 0:
            print("home")
            break
        case 1:
            print("account")
            break
        case 2:
            print("cart")
            break
        case 3:
            print("wishlist")
            break
        case 4:
            print("notifications")
            break
        default:
            print("default")
        }
    }

}

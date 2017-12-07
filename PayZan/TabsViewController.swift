//
//  TabsViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 25/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class TabsViewController: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self

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

//
//  menuViewController.swift
//  sideMenu
//
//  Created by MANOJ KUMAR on 21/09/17.
//  Copyright © 2017 MANOJ KUMAR. All rights reserved.
//

import UIKit

class menuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var menuArray = [String]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        menuArray = ["home","message","maps","settings"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return menuArray.count
        
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
     let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell")
        as!MenuTableViewCell
        
        cell.menuName.text! = menuArray[indexPath.row]
        
        return cell
        
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
//        if indexPath.row == 0 {
//            
//            let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "MsgViewController") as! MsgViewController
//            
//            self.navigationController?.pushViewController(homeViewController, animated: true)
//            
//        }
        
    }

    
    

}

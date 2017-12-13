//
//  EditBankProfileViewController.swift
//  PayZan
//
//  Created by Manoj on 05/12/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class EditBankProfileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var editProfileTableView: UITableView!
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!
    
    var selectedButtonString = ""
    
    var listArr1 = ["First Name","Last Name"]
    
    var male = true
    var female = false
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        editProfileTableView.dataSource = self
        editProfileTableView.delegate = self
        
        
        
        let nibName  = UINib(nibName: "EditProfileTableViewCell1" , bundle: nil)
        editProfileTableView.register(nibName, forCellReuseIdentifier: "EditProfileTableViewCell1")
        
        
        let nibName1  = UINib(nibName: "EditProfileTableViewCell2" , bundle: nil)
        editProfileTableView.register(nibName1, forCellReuseIdentifier: "EditProfileTableViewCell2")
        
        
        
        let nibName2  = UINib(nibName: "EditProfileTableViewCell3" , bundle: nil)
        editProfileTableView.register(nibName2, forCellReuseIdentifier: "EditProfileTableViewCell3")
        
        
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
    
    
    
    @IBAction func backAction(_ sender: Any) {
        
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        
        return 4
        
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 100
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            
            return 100
            
        }
        
        return 70
    }
    
    func maleBtnClicked(_ sender: UIButton) {
        
        male = true
        female = false
        
        
        
        let indexPath = IndexPath(item: 5, section: 1)
        
        editProfileTableView.reloadRows(at: [indexPath], with: .fade)
        
        editProfileTableView.reloadData()
        
        
    }
    
    func femaleBtnClicked(_ sender: UIButton){
        
        male = false
        female = true
        
        
        
        let indexPath = IndexPath(item: 5, section: 1)
        
        editProfileTableView.reloadRows(at: [indexPath], with: .fade)
        
        editProfileTableView.reloadData()
        
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if  (indexPath.row == 0) {
            
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditProfileTableViewCell1", for: indexPath) as! EditProfileTableViewCell1
            
            
            return cell
            
        }else if  (indexPath.row == 3){
            
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "EditProfileTableViewCell3", for: indexPath) as! EditProfileTableViewCell3
            
            
            return cell1
            
            
        } else{
            
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "EditProfileTableViewCell2", for: indexPath) as! EditProfileTableViewCell2
            
            cell2.detailsLbl.text = listArr1[indexPath.row - 1]
            cell2.detailsTF.placeholder = listArr1[indexPath.row - 1]
            
            
            
            return cell2
            
            
        }
        
        
        
    }
        
}


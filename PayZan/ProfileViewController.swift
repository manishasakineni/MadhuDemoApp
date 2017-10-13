//
//  ProfileViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 12/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,ViewControllerBDelegate {

    @IBOutlet weak var profileTVC: UITableView!
    
    var firstName  = String()
    var lastName  = String()
    var isUserLogin = true
    
    var labelText1:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        firstName = "Naveen"
        lastName  = "Chatla"
        
        
        self.profileTVC.delegate = self
        self.profileTVC.dataSource = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //        headerView.isHidden = false
        
//        self.tabBarController?.tabBar.isHidden = true
        
        
        super.viewDidAppear(true)
    }
    
    func textChanged(text: String?) {
        
         labelText1 = text!
        
        print("labelText:\(String(describing: labelText1))")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerB = segue.destination as? EditProfileViewController {
            viewControllerB.text = labelText1
            viewControllerB.delegate = self
            
            print("labelText1:\(String(describing: labelText1))")
        }
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section==0){
            return 1.0
        }
            
        else{
            return 1.0
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            
            return 1
            
        }
            
        else{
            
            return 7
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            
            if isUserLogin == false {
                
                return 100
                
            }
            
            return 470
        }
            
        else{
            
            return 70
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            if isUserLogin == false {
                
                let cell = Bundle.main.loadNibNamed("LoginTableViewCell", owner: self, options: nil)?.first as! LoginTableViewCell
                
                return cell
                
            }
            
            let cell = Bundle.main.loadNibNamed("ProfileTableViewCell", owner: self, options: nil)?.first as! ProfileTableViewCell
            
            
            cell.editProfileBtn.addTarget(self, action: #selector(self.btnAction), for: .touchUpInside)
            
            return cell
        }
        
        
        if isUserLogin == true {
            
            
            if indexPath.row == 6 {
                
                
                
                
                
                let cell = Bundle.main.loadNibNamed("SignOutTableViewCell", owner: self, options: nil)?.first as! SignOutTableViewCell
                
                cell.backgroundColor = #colorLiteral(red: 0.8835461612, green: 0.8835461612, blue: 0.8835461612, alpha: 1)
                
                cell.signOutBtn.addTarget(self, action: #selector(self.signOutClicked), for: .touchUpInside)
                
                
                
                return cell
            }
        }
        
        
        
        
        let cell = Bundle.main.loadNibNamed("ListTableViewCell", owner: self, options: nil)?.first as! ListTableViewCell
        
//        cell.ImgeVw.image = #imageLiteral(resourceName: "Thumb Sign")
        cell.textLbl?.text = "abcd"
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.section == 0 {
            
            let cell = ProfileTableViewCell()
            
            cell.selectionStyle = .none
            
        }
            
        else if indexPath.section == 1{
            
            let cell = ListTableViewCell()
            
            
            cell.selectionStyle = .default
            
        }
        
    }
    
    
    
    func btnAction(_ sender: UIButton) {
        
//        let ETVC: EditProfileViewController = storyboard!.instantiateViewController(withIdentifier: "EditProfileViewController") as! EditProfileViewController
//        
//        
//        
//        self.navigationController!.pushViewController(ETVC, animated: true)
        
        let editViewController = self.storyboard?.instantiateViewController(withIdentifier: "EditProfileViewController") as! EditProfileViewController
        
        UserDefaults.standard.set(firstName, forKey: "firstName")
        UserDefaults.standard.set(lastName, forKey: "lastName")
        
        self.navigationController?.pushViewController(editViewController, animated: true)
    }
    
    
    func signOutClicked(_sender: UIButton){
        
        
        isUserLogin = false
        self.profileTVC .reloadData()
        let button1 = UIBarButtonItem(image: UIImage(named: "Menu"), style: .plain, target: self, action: #selector(self.action))
        
        self.navigationItem.leftBarButtonItem  = button1
        
        self.navigationItem.title = "AAAAA"
        
        
        
    }
    
    
    func action(_sender: UIButton){
        
        print(111111)
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func searchAction(_ sender: Any) {
    }
    
    @IBAction func notificationAction(_ sender: Any) {
    }

}

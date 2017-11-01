//
//  ProfileViewController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 12/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,ViewControllerBDelegate {

    @IBOutlet weak var profileTVC: UITableView!
    
    var firstName  = String()
    var lastName  = String()
    
    var userNamee:String!
    var userEmail:String!
    var walletBal:String!
    
    var isUserLogin = true
    
    var labelText1:String?
    
    var listArr = ["Saved Cards","Order History","Change Password","About US","Support","Terms Of Service","Share"]
    
    var imageArray1 = [UIImage(named:"savedCards"),UIImage(named:"orderHistory"),UIImage(named:"changePassword"),UIImage(named:"about_us"),UIImage(named:"about_us"),UIImage(named:"about_us"),UIImage(named:"about_us")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let defaults = UserDefaults.standard
        
        
        if let walletamount = defaults.string(forKey: walletAmountt) {
            
            walletBal = walletamount
            
            print("defaults savedString: \(String(describing: walletBal))")
        }
        
        if let walletAmount = defaults.string(forKey: "walletAmount") {
            
            walletBal = walletAmount
            
            
            print("defaults savedString: \(walletAmount)")
        }
        
        
        if let userName = defaults.string(forKey: uNamee) {
            
            userNamee = userName
            
            print("userName: \(String(describing: userNamee))")
        }
        else {
            
            userNamee = "User Name"
        }
        
        if let email = defaults.string(forKey:emailIdd ) {
            
            userEmail = email
            
            print("userName: \(String(describing: userEmail))")
        }
        else {
            
            userEmail = "abc@gmail.com"
        }
        
        self.profileTVC.delegate = self
        self.profileTVC.dataSource = self
        
        self.profileTVC.separatorStyle = .none
        
//        profileTVC.separatorColor = UIColor.clear
        
        profileTVC.sectionIndexBackgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        profileTVC.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
       // profileTVC.layer.borderWidth = 2
       // profileTVC.layer.borderColor = UIColor.gray.cgColor
        
        
        let nibName  = UINib(nibName: "ListTableViewCell" , bundle: nil)
        profileTVC.register(nibName, forCellReuseIdentifier: "ListTableViewCell")
        
        let nibName1  = UINib(nibName: "SignOutTableViewCell" , bundle: nil)
        profileTVC.register(nibName1, forCellReuseIdentifier: "SignOutTableViewCell")
        
        let nibName2  = UINib(nibName: "ProfileTableViewCell" , bundle: nil)
        profileTVC.register(nibName2, forCellReuseIdentifier: "ProfileTableViewCell")
        
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.tabBarController?.tabBar.isHidden = false
        
        
        let defaults = UserDefaults.standard
        
        if let walletAmount = defaults.string(forKey: "walletAmount") {
            
            walletBal = walletAmount
                        
            print("defaults savedString: \(walletAmount)")
            
            profileTVC.reloadData()
        }
        
        
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
        
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if(section==0){
            return 1.0
        }
        else if(section==1) {
            
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
        else if section == 1 {
            
            return listArr.count
        }
        else{
            
            return 1
        }
        
        
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 20.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            
            if isUserLogin == false {
                
                return 80
                
            }
            
            return 80
        }
        else if indexPath.section == 1 {
            
            return 40
        }
            
        else{
            
            return 60
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            
            if isUserLogin == false {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "SignOutTableViewCell", for: indexPath) as! SignOutTableViewCell
                
                cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

                
                return cell
                
            }
            
             let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
            
            cell.addMoneyBtn.addTarget(self, action: #selector(self.addMoneyAction), for: .touchUpInside)

            cell.editProfileBtn.addTarget(self, action: #selector(self.btnAction), for: .touchUpInside)
            
            cell.editBtn.addTarget(self, action: #selector(self.editAction), for: .touchUpInside)
            
            cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.layer.borderWidth = 0.5
            cell.layer.borderColor = UIColor.lightGray.cgColor
            
             cell.userNameLabel.font = UIFont(name:"Helvetica Neue", size:11)
            cell.userNameLabel.text = userNamee
            cell.emaiLabel.font = UIFont(name:"Helvetica Neue", size:10)
            cell.emaiLabel.text = userEmail
            cell.addWalletLabel.text = walletBal
            
            return cell
        }
        else if indexPath.section == 1 {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        
        cell.selectionStyle = .none
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cell.textLbl?.text = listArr[indexPath.row]
        cell.ImgeVw.image = imageArray1[indexPath.row]
        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.lightGray.cgColor
        
        cell.textLbl.font = UIFont(name:"Helvetica Neue", size:10)
        cell.textLbl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        return cell
    }
        else {
        
//            if isUserLogin == true {
        
                
//                if indexPath.row == 7 {
                
                    let cell = tableView.dequeueReusableCell(withIdentifier: "SignOutTableViewCell", for: indexPath) as! SignOutTableViewCell
                    
                    //                let cell = Bundle.main.loadNibNamed("SignOutTableViewCell", owner: self, options: nil)?.first as! SignOutTableViewCell
                    
                    //                cell.backgroundColor = #colorLiteral(red: 0.8835461612, green: 0.8835461612, blue: 0.8835461612, alpha: 1)
                    
                    cell.signOutBtn.addTarget(self, action: #selector(self.signOutClicked), for: .touchUpInside)
                    cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    //                cell.contentView.layer.cornerRadius = 20
                    //                cell.contentView.layer.borderWidth = 1.0
                    //
                    //                cell.contentView.layer.borderColor = UIColor.clear.cgColor
                    //                cell.contentView.layer.masksToBounds = true
                    //
                    //                cell.layer.shadowColor = UIColor.lightGray.cgColor
                    //                cell.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
                    //                cell.layer.shadowRadius = 5.0
                    //                cell.layer.shadowOpacity = 1.0
                    //                cell.layer.cornerRadius = 15
                    //                cell.layer.masksToBounds = false
                    //                cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
                    
                    //                cell.contentView.layer.backgroundColor = UIColor.red.cgColor
                    
                    
                    
                    return cell
                }
//            }
        
//        }
    
        
        }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.section == 0 {
            
//            let cell = ProfileTableViewCell()
            
//            cell.selectionStyle = .none
            
        }
            
        else if indexPath.section == 1{
            
//            let cell = ListTableViewCell()
            
            
//            cell.selectionStyle = .none
            
        }
        
    }
    
    func editAction(_ sender: UIButton){
        
        let editViewController = self.storyboard?.instantiateViewController(withIdentifier: "EditProfileViewController") as! EditProfileViewController
        
       
        
        self.navigationController?.pushViewController(editViewController, animated: true)
    }
    
    
    func addMoneyAction(_ sender: UIButton) {
        
        let addMoneyViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddMoneyWalletViewController") as! AddMoneyWalletViewController
        
        addMoneyViewController.indexValue = 1
        addMoneyViewController.isHiddenWithdrawView = false
        addMoneyViewController.isHiddenSendView = true
        addMoneyViewController.isHiddenTransactionView = true
    
        self.navigationController?.pushViewController(addMoneyViewController, animated: true)
        
    }
    
    func btnAction(_ sender: UIButton) {
        
        
    }
    
    
    func signOutClicked(_sender: UIButton){
        
        
//        isUserLogin = false
//        self.profileTVC .reloadData()
//        let button1 = UIBarButtonItem(image: UIImage(named: "Menu"), style: .plain, target: self, action: #selector(self.action))
//        
//        self.navigationItem.leftBarButtonItem  = button1
//        
//        self.navigationItem.title = "AAAAA"
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = viewController
        
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

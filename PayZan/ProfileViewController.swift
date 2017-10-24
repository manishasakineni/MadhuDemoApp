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
    
    var listArr = ["Saved Cards","Order History","Change Password","About US","Support","Terms Of Service","Share"]
    
    var imageArray1 = [UIImage(named:"savedCards"),UIImage(named:"orderHistory"),UIImage(named:"changePassword"),UIImage(named:"about_us"),UIImage(named:"about_us"),UIImage(named:"about_us"),UIImage(named:"about_us")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        firstName = "Naveen"
        lastName  = "Chatla"
        
        
        self.profileTVC.delegate = self
        self.profileTVC.dataSource = self
        
//        profileTVC.separatorColor = UIColor.clear
        
        profileTVC.sectionIndexBackgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        profileTVC.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
       // profileTVC.layer.borderWidth = 2
       // profileTVC.layer.borderColor = UIColor.gray.cgColor
        
        
        
        
        
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
            
            return listArr.count
            
        }
        
        
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 20.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            
            if isUserLogin == false {
                
                return 100
                
            }
            
            return 120
        }
            
        else{
            
            return 60
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let containerView:UIView = UIView(frame:CGRect(x: 10, y: 100, width: 300, height: 400))
//        self.profileTVC = UITableView(frame: containerView.bounds, style: .plain)
//        containerView.backgroundColor = UIColor.clear
//        containerView.layer.shadowColor = UIColor.darkGray.cgColor
//        containerView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
//        containerView.layer.shadowOpacity = 1.0
//        containerView.layer.shadowRadius = 2
//        
//        self.profileTVC.layer.cornerRadius = 10
//        self.profileTVC.layer.masksToBounds = true
//        self.view.addSubview(containerView)
//        containerView.addSubview(self.profileTVC)
        
        if indexPath.section == 0 {
            
            if isUserLogin == false {
                
                let cell = Bundle.main.loadNibNamed("LoginTableViewCell", owner: self, options: nil)?.first as! LoginTableViewCell
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
            
            let cell = Bundle.main.loadNibNamed("ProfileTableViewCell", owner: self, options: nil)?.first as! ProfileTableViewCell
            
            cell.addMoneyBtn.addTarget(self, action: #selector(self.addMoneyAction), for: .touchUpInside)

            
            cell.editProfileBtn.addTarget(self, action: #selector(self.btnAction), for: .touchUpInside)
            cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.layer.borderWidth = 0.5
            cell.layer.borderColor = UIColor.lightGray.cgColor
            
//            cell.layer.cornerRadius = 05
//            cell.layer.borderWidth = 1.0
//            
//            cell.layer.borderColor = UIColor.clear.cgColor
//            cell.layer.masksToBounds = false
//            
//            cell.layer.shadowColor = UIColor.lightGray.cgColor
//            cell.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
//            cell.layer.shadowRadius = 5.0
//            cell.layer.shadowOpacity = 1.0
//            cell.layer.cornerRadius = 10
//            cell.layer.masksToBounds = false
//            cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
            
            
            return cell
        }
        
        
        if isUserLogin == true {
            
            
            if indexPath.row == 6 {
                
                
                let cell = Bundle.main.loadNibNamed("SignOutTableViewCell", owner: self, options: nil)?.first as! SignOutTableViewCell
                
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
        }
        
        
        
        
        let cell = Bundle.main.loadNibNamed("ListTableViewCell", owner: self, options: nil)?.first as! ListTableViewCell
        
//        cell.ImgeVw.image = #imageLiteral(resourceName: "Thumb Sign")
        cell.textLbl?.text = listArr[indexPath.row]
        cell.ImgeVw.image = imageArray1[indexPath.row]
        
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.lightGray.cgColor
        
//        cell.mainBackground.layer.cornerRadius = 8
//        cell.mainBackground.layer.masksToBounds = true
//        
//        cell.shadowLayer.layer.masksToBounds = false
//        cell.shadowLayer.layer.shadowOffset = CGSizeMake(0, 0)
//        cell.shadowLayer.layer.shadowColor = UIColor.blackColor().CGColor
//        cell.shadowLayer.layer.shadowOpacity = 0.23
//        cell.shadowLayer.layer.shadowRadius = 4
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.section == 0 {
            
            let cell = ProfileTableViewCell()
            
            cell.selectionStyle = .none
            
        }
            
        else if indexPath.section == 1{
            
            let cell = ListTableViewCell()
            
            
            cell.selectionStyle = .none
            
        }
        
    }
    
    
    
    func addMoneyAction(_ sender: UIButton) {
        
        let addMoneyViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddMoneyWalletViewController") as! AddMoneyWalletViewController
    
        self.navigationController?.pushViewController(addMoneyViewController, animated: true)
        
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

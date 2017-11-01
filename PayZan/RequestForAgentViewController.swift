//
//  RequestForAgentViewController.swift
//  PayZan
//
//  Created by Harikrishna Unnam on 28/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

protocol RequeatAgentDelegate: class {
    
    func textChanged(text:String?)
    
}

class RequestForAgentViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    
let headerTitle = "PERSONAL INFORMATION"
    
    @IBOutlet weak var requestForAgentTableView: UITableView!
    
    weak var reqdelegate: RequeatAgentDelegate?
    
    
    var placeholdersAry  = ["Select District","Select Mandal","Select Village","First Name","Middle Name","Last Name","Mobile No","Email","Address1","Address2"]


    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let nibName  = UINib(nibName: "AddAgentRequestTableViewCell" , bundle: nil)
        requestForAgentTableView.register(nibName, forCellReuseIdentifier: "AddAgentRequestTableViewCell")
        
        let nibName1  = UINib(nibName: "SubmitAgentTableViewCell" , bundle: nil)
        requestForAgentTableView.register(nibName1, forCellReuseIdentifier: "SubmitAgentTableViewCell")
        
        requestForAgentTableView.dataSource = self
        requestForAgentTableView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section==0){
            return 1.0
        }
            
        else{
            return 20.0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        
        var headerView = UIView()
        headerView.backgroundColor = #colorLiteral(red: 0.9222715736, green: 0.9222715736, blue: 0.9222715736, alpha: 1)
        
        if (section == 0) {
            headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 2))
            
        }
        else {
            
             headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 2))
        }
        
        return headerView
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            
            return 50
        }
            
        else{
            
            return 60
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        return nil
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 10
        }
            
        else if section == 1 {
            
            return  1
        }
        
        return 0
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddAgentRequestTableViewCell") as! AddAgentRequestTableViewCell
        
        cell.selectionStyle = .none
        
        if indexPath.row == 0{
            
            cell.titleLabel?.text = "Select District"
            cell.agentRequestField.placeholder = "Select District"
            
//            reqdelegate?.textChanged(text: cell.titleLabel?.text)
            
        }
         else if indexPath.row == 1{
            
            cell.titleLabel?.text = "Select Mandal"
            cell.agentRequestField.placeholder = "Select Mandal"
            
        }
        else if indexPath.row == 2{
            
            cell.titleLabel?.text = "Select Village"
            cell.agentRequestField.placeholder = "Select Village"
            
        }
        else if indexPath.row == 3{
            
            cell.titleLabel?.text = "First Name"
            cell.agentRequestField.placeholder = "First Name"
            
        }
        else if indexPath.row == 4{
            
            cell.titleLabel?.text = "Middle Name"
            cell.agentRequestField.placeholder = "Middle Name"
            
        }
        else if indexPath.row == 5{
            
            cell.titleLabel?.text = "Last Name"
            cell.agentRequestField.placeholder = "Last Name"
            
        }
        else if indexPath.row == 6{
            
            cell.titleLabel?.text = "Mobile No"
            cell.agentRequestField.placeholder = "Mobile No"
            
        }
        else if indexPath.row == 7{
            
            cell.titleLabel?.text = "Email"
            cell.agentRequestField.placeholder = "Email"
            
        }
        else if indexPath.row == 8{
            
            cell.titleLabel?.text = "Address1"
            cell.agentRequestField.placeholder = "Address1"
            
        }
        else if indexPath.row == 9{
            
            cell.titleLabel?.text = "Address2"
            cell.agentRequestField.placeholder = "Address2"
            
        }
            return cell
            
        }
        else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SubmitAgentTableViewCell", for: indexPath) as! SubmitAgentTableViewCell
            
            
            cell.submitBtn.addTarget(self, action: #selector(self.submitAgentAction), for: .touchUpInside)
            
            return cell
        }
        
        
    }
    
    func submitAgentAction(_ sender: UIButton) {
        
    print("sender:\(sender.tag)")
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func notificationAction(_ sender: Any) {
        
    }
    
    
}
    
    
    
    
    
    
    
    



    




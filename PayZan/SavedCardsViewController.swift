//
//  SavedCardsViewController.swift
//  NewScreens
//
//  Created by Manoj on 23/11/17.
//  Copyright © 2017 Manoj. All rights reserved.
//

import UIKit

class SavedCardsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var savedCardTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let nibName  = UINib(nibName: "SavedTableViewCell" , bundle: nil)
        savedCardTableView.register(nibName, forCellReuseIdentifier: "SavedTableViewCell")
        
        
        
        
        savedCardTableView.dataSource = self
        savedCardTableView.delegate = self
        
        
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
        
        
        return 1
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return 100
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 100
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SavedTableViewCell", for: indexPath) as! SavedTableViewCell
        
        return cell
        
        
        
        
    }
    
    
    
}

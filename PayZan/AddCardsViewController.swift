//
//  AddCardsViewController.swift
//  NewScreens
//
//  Created by Manoj on 23/11/17.
//  Copyright © 2017 Manoj. All rights reserved.
//

import UIKit

class AddCardsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var addableView: UITableView!
    
    @IBOutlet weak var headerImgHeight: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let nibName  = UINib(nibName: "AddCardsTableViewCell" , bundle: nil)
        addableView.register(nibName, forCellReuseIdentifier: "AddCardsTableViewCell")
        
        
        
        
        addableView.dataSource = self
        addableView.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddCardsTableViewCell", for: indexPath) as! AddCardsTableViewCell
        
        return cell
        
        
        
        
    }
    

}

//
//  PayzAppViewController.swift
//  PayZanScrollViewScreens
//
//  Created by MANOJ KUMAR on 12/10/17.
//  Copyright © 2017 MANOJ KUMAR. All rights reserved.
//

import UIKit

class PayzAppViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    
    @IBOutlet var savedCardButtonOutLet: UIButton!
    
    @IBOutlet var creditCardButtonOutLet: UIButton!
    
    @IBOutlet var debitCardButtonOutLet: UIButton!
    
    @IBOutlet var netBankingButtonOutLet: UIButton!
    
       
    var selectedButtonString = ""
    
    
    @IBOutlet var savedCardsLabel: UILabel!
    
    
    @IBOutlet var creditCardLabel: UILabel!
    
    @IBOutlet var debitCardLabel: UILabel!
    
    @IBOutlet var netBankingLabel: UILabel!
    
    //CalibrageMac02.PayZan
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nibName  = UINib(nibName: "SavedCardsTableViewCell" , bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "SavedCardsTableViewCell")

        let nibName1  = UINib(nibName: "CreditCardTableViewCell" , bundle: nil)
        tableView.register(nibName1, forCellReuseIdentifier: "CreditCardTableViewCell")

        
        let nibName2  = UINib(nibName: "DebitCardTableViewCell" , bundle: nil)
        tableView.register(nibName2, forCellReuseIdentifier: "DebitCardTableViewCell")

        
        let nibName3  = UINib(nibName: "NetBankingTableViewCell" , bundle: nil)
        tableView.register(nibName3, forCellReuseIdentifier: "NetBankingTableViewCell")

        
        
        selectedButtonString = "savedCards"



        borderColors()
        
    }

    func borderColors(){
        
        savedCardButtonOutLet.layer.borderWidth = 1
        
       // savedCardButtonOutLet.layer.borderColor = UIColor.orange.cgColor
    
        savedCardButtonOutLet.layer.borderColor = UIColor(red:238.0/255.0, green:224.0/255.0, blue:225.0/255.0, alpha: 1.0).cgColor
        
        savedCardButtonOutLet.layer.cornerRadius = 10

        
        creditCardButtonOutLet.layer.borderWidth = 1
        creditCardButtonOutLet.layer.borderColor = UIColor(red:238.0/255.0, green:224.0/255.0, blue:225.0/255.0, alpha: 1.0).cgColor
        creditCardButtonOutLet.layer.cornerRadius = 10
        
        
        
        debitCardButtonOutLet.layer.borderWidth = 1
        debitCardButtonOutLet.layer.borderColor = UIColor(red:238.0/255.0, green:224.0/255.0, blue:225.0/255.0, alpha: 1.0).cgColor
        debitCardButtonOutLet.layer.cornerRadius = 10
        
        
        netBankingButtonOutLet.layer.borderWidth = 1
        netBankingButtonOutLet.layer.borderColor = UIColor(red:238.0/255.0, green:224.0/255.0, blue:225.0/255.0, alpha: 1.0).cgColor
        netBankingButtonOutLet.layer.cornerRadius = 10
        
        


        
        
    }
    
    
    public func numberOfSections(in tableView: UITableView) -> Int{
        
        return 1
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 1
    }
   
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        

        return UITableViewAutomaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  (indexPath.row == 0) {
            
            if(selectedButtonString == "savedCards"){
                let cell = tableView.dequeueReusableCell(withIdentifier: "SavedCardsTableViewCell", for: indexPath) as! SavedCardsTableViewCell
                
                return cell
            }else if(selectedButtonString == "creditCard"){
                let cell = tableView.dequeueReusableCell(withIdentifier: "CreditCardTableViewCell", for: indexPath) as! CreditCardTableViewCell
                
                return cell
            }else if(selectedButtonString == "debitCard"){
                let cell = tableView.dequeueReusableCell(withIdentifier: "DebitCardTableViewCell", for: indexPath) as! DebitCardTableViewCell
                
                return cell
            }else if(selectedButtonString == "netBanking"){
                let cell = tableView.dequeueReusableCell(withIdentifier: "NetBankingTableViewCell", for: indexPath) as! NetBankingTableViewCell
                
                
                
                return cell
                
            }else{
                
               return UITableViewCell()
            }
          
        }
       return UITableViewCell()
      

    }
    
            override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func savedCardsButtonAction(_ sender: Any) {
        selectedButtonString = "savedCards"
        
        
        creditCardButtonOutLet.backgroundColor = UIColor.white
        debitCardButtonOutLet.backgroundColor = UIColor.white
        netBankingButtonOutLet.backgroundColor = UIColor.white

        
        savedCardButtonOutLet.backgroundColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        savedCardsLabel.textColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)

        creditCardLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)

        debitCardLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)

        netBankingLabel.textColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)

        
        savedCardsLabel.textColor = UIColor.white

        savedCardButtonOutLet.setImage(UIImage(named: "payment_savedcaddetails_white"), for: UIControlState.normal)
//        savedCardButtonOutLet.setBackgroundImage(UIImage(named: "payment_savedcaddetails_white"), for: UIControlState.normal)
        
        debitCardButtonOutLet.setImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
        netBankingButtonOutLet.setImage(UIImage(named: "payment_bank_active"), for: UIControlState.normal)
        creditCardButtonOutLet.setImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
        
//        debitCardButtonOutLet.setBackgroundImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
//        netBankingButtonOutLet.setBackgroundImage(UIImage(named: "payment_bank_active"), for: UIControlState.normal)
//        creditCardButtonOutLet.setBackgroundImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)


        tableView.reloadData()
        
    }
    
    
    @IBAction func creditCardButtonAction(_ sender: Any) {
        selectedButtonString = "creditCard"
        
        
        savedCardButtonOutLet.backgroundColor = UIColor.white
        netBankingButtonOutLet.backgroundColor = UIColor.white
        debitCardButtonOutLet.backgroundColor = UIColor.white

        creditCardButtonOutLet.backgroundColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        savedCardsLabel.textColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        creditCardLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)

        debitCardLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        netBankingLabel.textColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)

        
        creditCardLabel.textColor = UIColor.white
        
        
        creditCardButtonOutLet.setImage(UIImage(named: "payment_creditcard_white"), for: UIControlState.normal)
        
        savedCardButtonOutLet.setImage(UIImage(named: "payment_savedcaddetails_active"), for: UIControlState.normal)
        debitCardButtonOutLet.setImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
        netBankingButtonOutLet.setImage(UIImage(named: "payment_bank_active"), for: UIControlState.normal)
        

//        creditCardButtonOutLet.setBackgroundImage(UIImage(named: "payment_creditcard_white"), for: UIControlState.normal)
//
//        savedCardButtonOutLet.setBackgroundImage(UIImage(named: "payment_savedcaddetails_active"), for: UIControlState.normal)
//        debitCardButtonOutLet.setBackgroundImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
//        netBankingButtonOutLet.setBackgroundImage(UIImage(named: "payment_bank_active"), for: UIControlState.normal)


        
        tableView.reloadData()


    }
    
    @IBAction func debitCardBUttonAction(_ sender: Any) {
        selectedButtonString = "debitCard"
        
        savedCardButtonOutLet.backgroundColor = UIColor.white
        creditCardButtonOutLet.backgroundColor = UIColor.white
        netBankingButtonOutLet.backgroundColor = UIColor.white

        
        debitCardButtonOutLet.backgroundColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        
        savedCardsLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        creditCardLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        debitCardLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        netBankingLabel.textColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)

        
        debitCardLabel.textColor = UIColor.white
        
        
        debitCardButtonOutLet.setImage(UIImage(named: "payment_creditcard_white"), for: UIControlState.normal)
        
        savedCardButtonOutLet.setImage(UIImage(named: "payment_savedcaddetails_active"), for: UIControlState.normal)
        creditCardButtonOutLet.setImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
        netBankingButtonOutLet.setImage(UIImage(named: "payment_bank_active"), for: UIControlState.normal)
        
        
//        debitCardButtonOutLet.setBackgroundImage(UIImage(named: "payment_creditcard_white"), for: UIControlState.normal)
//
//        
//        savedCardButtonOutLet.setBackgroundImage(UIImage(named: "payment_savedcaddetails_active"), for: UIControlState.normal)
//        creditCardButtonOutLet.setBackgroundImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
//        netBankingButtonOutLet.setBackgroundImage(UIImage(named: "payment_bank_active"), for: UIControlState.normal)

        
        


         tableView.reloadData()
    }
    
    @IBAction func netBankingButtonAction(_ sender: Any) {
        selectedButtonString = "netBanking"
        
        savedCardButtonOutLet.backgroundColor = UIColor.white
        creditCardButtonOutLet.backgroundColor = UIColor.white
        debitCardButtonOutLet.backgroundColor = UIColor.white

        netBankingButtonOutLet.backgroundColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        savedCardsLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        
        debitCardLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)

        creditCardLabel.textColor =  UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)
        netBankingLabel.textColor = UIColor(red:151.0/255.0, green:12.0/255.0, blue:10.0/255.0, alpha: 1.0)

        netBankingLabel.textColor = UIColor.white
        
        netBankingButtonOutLet.setImage(UIImage(named: "payment_bank_white"), for: UIControlState.normal)
        
        savedCardButtonOutLet.setImage(UIImage(named: "payment_savedcaddetails_active"), for: UIControlState.normal)
        debitCardButtonOutLet.setImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
        creditCardButtonOutLet.setImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
        
//        netBankingButtonOutLet.setBackgroundImage(UIImage(named: "payment_bank_white"), for: UIControlState.normal)
//
//        savedCardButtonOutLet.setBackgroundImage(UIImage(named: "payment_savedcaddetails_active"), for: UIControlState.normal)
//        debitCardButtonOutLet.setBackgroundImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)
//        creditCardButtonOutLet.setBackgroundImage(UIImage(named: "payment_creitcard_active"), for: UIControlState.normal)


         tableView.reloadData()
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
   
   
}













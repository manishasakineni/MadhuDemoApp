//
//  TableViewCell1.swift
//  PageView_Naveen
//
//  Created by Nani Mac on 21/09/17.
//  Copyright © 2017 Naveen. All rights reserved.
//

import UIKit

class TableViewCell1: UITableViewCell,UITextFieldDelegate  {
    
    @IBOutlet weak var FNLbl: UILabel!
    
    @IBOutlet weak var LNLbl: UILabel!
    
    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    @IBOutlet weak var profileImag: UIImageView!
    
    @IBOutlet weak var editButton: UIButton!
    
    
   

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       // FNLbl.isHidden = true
      firstNameTF.delegate = self
      lastNameTF.delegate = self
        
        hideLabels()
        
        if let X = UserDefaults.standard.object(forKey: "firstName") as? String
        {
        
        firstNameTF.text = X
        }
        
        if let Y = UserDefaults.standard.object(forKey: "lastName") as? String
        {
            
            lastNameTF.text = Y
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func hideLabels(){
    
        if (firstNameTF.text != nil)  {
            
            FNLbl.isHidden = false
        }
        
        else{
        
        FNLbl.isHidden = true
        
        }
        
        if (lastNameTF.text != nil)  {
            
            LNLbl.isHidden = false
        }
            
        else{
            
            LNLbl.isHidden = true
            
        }

    
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if  textField == firstNameTF {
    
    
        if (firstNameTF.text != nil)  {
            
            FNLbl.isHidden = true
            
            
        }
            
        else{
            
            FNLbl.isHidden = false
            
            
        }
            
        }
        
        if textField == lastNameTF {
        
        
        if (lastNameTF.text != nil)  {
            
            LNLbl.isHidden = true
            
        }
            
        else{
            
            LNLbl.isHidden = false
            
            
        }
        }
    
    }
    
        func textFieldDidEndEditing(_ textField: UITextField) {
    
            if (firstNameTF.text != nil)  {
                
                FNLbl.isHidden = false
            }
                
            else{
                
                FNLbl.isHidden = true
                
            }
            
            if (lastNameTF.text != nil)  {
                
                LNLbl.isHidden = false
            }
                
            else{
                
                LNLbl.isHidden = true
                
            }
    
        }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if firstNameTF.text == nil {
            
            self.FNLbl.isHidden = true
            self.LNLbl.isHidden = false
        }
        
        if lastNameTF.text == nil {
            
            self.LNLbl.isHidden = true
            self.FNLbl.isHidden = false
            
        }
        
        return true;
    }
    
}

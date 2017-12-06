//
//  EditProfileTableViewCell2.swift
//  NewScreens
//
//  Created by Manoj on 22/11/17.
//  Copyright © 2017 Manoj. All rights reserved.
//

import UIKit

class EditProfileTableViewCell2: UITableViewCell,UITextFieldDelegate {
    
    @IBOutlet weak var detailsLbl: UILabel!
    
    @IBOutlet weak var detailsTF: UITextField!
    
    


    override func awakeFromNib() {
        super.awakeFromNib()
        
        detailsTF.delegate = self
        
        
      hideLabels()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func hideLabels(){
        
        if (detailsTF.text != nil)  {
            
           detailsLbl.isHidden = true
        }
            
        else{
            
            detailsLbl.isHidden = false
            
        }
        
        if (detailsTF.text != nil)  {
            
            detailsLbl.isHidden = true
        }
            
        else{
            
            detailsLbl.isHidden = false
            
        }
        
        
    }

    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if  textField == detailsTF {
            
            
            if (detailsTF.text != nil)  {
                
                detailsLbl.isHidden = false
                
                
            }
                
            else{
                
                detailsLbl.isHidden = true
                
                
            }
            
        }
        
        if textField == detailsTF {
            
            
            if (detailsTF.text != nil)  {
                
                detailsLbl.isHidden = false
                
            }
                
            else{
                
                detailsLbl.isHidden = true
                
                
            }
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if (detailsTF.text != nil)  {
            
            detailsLbl.isHidden = true
        }
            
        else{
            
            detailsLbl.isHidden = false
            
        }
        
        
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if detailsTF.text == nil {
            
            self.detailsLbl.isHidden = true
            self.detailsLbl.isHidden = false
        }
        
        
        
        return true;
    }
    

    
}

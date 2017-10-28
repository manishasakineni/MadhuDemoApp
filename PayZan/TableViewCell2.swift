//
//  TableViewCell2.swift
//  PageView_Naveen
//
//  Created by Nani Mac on 21/09/17.
//  Copyright © 2017 Naveen. All rights reserved.
//

import UIKit

class TableViewCell2: UITableViewCell,UITextFieldDelegate {
    
    
    
    @IBOutlet weak var detailsLbl: UILabel!
    
    @IBOutlet weak var detailsTF: UITextField!
    
    @IBOutlet weak var ImgVW: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        detailsTF.delegate = self
        
        hideLabels()
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
        
        if detailsTF.text == nil {
            
            self.detailsLbl.isHidden = true
            self.detailsLbl.isHidden = false
            
        }
        
        return true;
    }
   
    
}

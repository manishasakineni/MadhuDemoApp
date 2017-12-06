//
//  EditProfileTableViewCell1.swift
//  NewScreens
//
//  Created by Manoj on 22/11/17.
//  Copyright © 2017 Manoj. All rights reserved.
//

import UIKit

class EditProfileTableViewCell1: UITableViewCell,UITextFieldDelegate {

    @IBOutlet weak var FNLbl: UILabel!
    
    @IBOutlet weak var LNLbl: UILabel!
    
    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    @IBOutlet weak var profileImag: UIImageView!
    
    
    @IBOutlet weak var changePhotoButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        firstNameTF.delegate = self
        lastNameTF.delegate = self
        
        firstNameTF.layer.borderWidth = 0.5
        firstNameTF.layer.borderColor = UIColor.lightGray.cgColor
        firstNameTF.layer.cornerRadius = 3
        firstNameTF.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        lastNameTF.layer.borderWidth = 0.5
        lastNameTF.layer.borderColor = UIColor.lightGray.cgColor
        lastNameTF.layer.cornerRadius = 3
        lastNameTF.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
        
        hideLabels()
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
    
    func hideLabels(){
        
        if (firstNameTF.text != nil)  {
            
            FNLbl.isHidden = true
        }
            
        else{
            
            FNLbl.isHidden = false
            
        }
        
        if (lastNameTF.text != nil)  {
            
            LNLbl.isHidden = true
        }
            
        else{
            
            LNLbl.isHidden = false
            
        }
        
        
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if  textField == firstNameTF {
            
            
            if (firstNameTF.text != nil)  {
                
                FNLbl.isHidden = false
                
                
            }
                
            else{
                
                FNLbl.isHidden = true
                
                
            }
            
        }
        
        if textField == lastNameTF {
            
            
            if (lastNameTF.text != nil)  {
                
                LNLbl.isHidden = false
                
            }
                
            else{
                
                LNLbl.isHidden = true
                
                
            }
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if (firstNameTF.text != nil)  {
            
            FNLbl.isHidden = true
        }
            
        else{
            
            FNLbl.isHidden = false
            
        }
        
        if (lastNameTF.text != nil)  {
            
            LNLbl.isHidden = true
        }
            
        else{
            
            LNLbl.isHidden = false
            
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

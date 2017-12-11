//
//  AddAgentRequestTableViewCell.swift
//  PayZan
//
//  Created by CalibrageMac02 on 30/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import UIKit

class AddAgentRequestTableViewCell: UITableViewCell,UITextFieldDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var agentRequestField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        agentRequestField.layer.borderWidth = 0.5
        agentRequestField.layer.borderColor = UIColor.lightGray.cgColor
        agentRequestField.layer.cornerRadius = 3
        agentRequestField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)

        
        agentRequestField.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
      
        // Configure the view for the selected state
        
        hideLabels()
    }
    
    func hideLabels(){
        
        if (agentRequestField.text != nil)  {
            
            titleLabel.isHidden = true
        }
            
        else{
            
            titleLabel.isHidden = false
            
        }
        
        if (agentRequestField.text != nil)  {
            
            titleLabel.isHidden = true
        }
            
        else{
            
            titleLabel.isHidden = false
            
        }
        
        
    }
    
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        
//        if  textField == agentRequestField {
//            
//            
//            if (agentRequestField.text != nil)  {
//                
//                titleLabel.isHidden = false
//                
//                
//            }
//                
//            else{
//                
//                titleLabel.isHidden = true
//                
//                
//            }
//            
//        }
//        
//        if textField == agentRequestField {
//            
//            
//            if (agentRequestField.text != nil)  {
//                
//                titleLabel.isHidden = false
//                
//            }
//                
//            else{
//                
//                titleLabel.isHidden = true
//                
//                
//            }
//        }
//        
//    }
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        
//        if (agentRequestField.text != nil)  {
//            
//            titleLabel.isHidden = true
//        }
//            
//        else{
//            
//            titleLabel.isHidden = false
//            
//        }
//        
//        
//    }
    
    
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        
//        if agentRequestField.text == nil {
//            
//            self.titleLabel.isHidden = true
//            self.titleLabel.isHidden = false
//        }
//        
//        
//        
//        return true;
//    }
    
}

//
//  SignUpResultVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 07/11/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

class SignUpResultVo: Mappable {
    
    //MARK:-  Declaration of SignUpResultVo

    
    var Id: String?
    var Email: String?
    var UserName: String?
    var PhoneNumber: String?
    
    //MARK:-  initialization of SignUpResultVo

    
    init(Id:String?, Email:String?, UserName:String?, PhoneNumber:String?) {
        
        self.Id = Id
        self.Email = Email
        self.UserName = UserName
        self.PhoneNumber = PhoneNumber
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        Id <- map["Id"]
        Email <- map["Email"]
        UserName <- map["UserName"]
        PhoneNumber <- map["PhoneNumber"]
        
    }
    
}

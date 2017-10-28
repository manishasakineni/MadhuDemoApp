//
//  UserVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 13/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

class UserVo: Mappable {
    
    
    
        var Id: String?
        var Email: String?
        var UserName: String?
        var PhoneNumber: String?
    
    
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

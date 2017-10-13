//
//  UserVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 13/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

class UserVo: Mappable {
    
    
    var User: RespVo?
    var Roles:[SampleVo]?
    var ActivityRights:[GetActVo]?
    var UserWallet:GetUserWalletVo?
    
    init(User:RespVo?, Roles:[SampleVo]?, ActivityRights:[GetActVo]?,UserWallet:GetUserWalletVo?) {
        
        self.User = User
        self.Roles = Roles
        self.ActivityRights = ActivityRights
        self.UserWallet = UserWallet

    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        User <- map["User"]
        Roles <- map["Roles"]
        ActivityRights <- map["ActivityRights"]
        UserWallet <- map["UserWallet"]
        
    }
}

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
    
    init(User:RespVo?) {
        self.User = User
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        User <- map["User"]
    }
}

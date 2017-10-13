//
//  RolesVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 13/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

class RolesVo: Mappable {
    
    var UserId: String?
    var RoleId: String?
    
    init(UserId: String?,RoleId: String?) {
        self.UserId = UserId
        self.RoleId = RoleId
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        UserId <- map["UserId"]
        RoleId <- map["RoleId"]
    }
}

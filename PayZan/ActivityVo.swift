//
//  ActivityRightsVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 13/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

class ActivityVo: Mappable {
    
    var RoleId: String?
    var ActivityRightId: String?
    var CreatedByUserId: String?
    var CreatedDate: String?
    var UpdatedByUserId: Any?
    var UpdatedDate: String?
    
    init(RoleId: String?,ActivityRightId: String?,CreatedByUserId: String?,CreatedDate:String?,UpdatedByUserId: Any?,UpdatedDate: String?) {
        self.RoleId = RoleId
        self.ActivityRightId = ActivityRightId
        self.CreatedByUserId = CreatedByUserId
        self.CreatedDate = CreatedDate
        self.UpdatedByUserId = UpdatedByUserId
        self.UpdatedDate = UpdatedDate
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        RoleId <- map["RoleId"]
        ActivityRightId <- map["ActivityRightId"]
        CreatedByUserId <- map["CreatedByUserId"]
        CreatedDate <- map["CreatedDate"]
        UpdatedByUserId <- map["UpdatedByUserId"]
        UpdatedDate <- map["UpdatedDate"]
    }
}

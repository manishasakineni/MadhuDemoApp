//
//  ActivityRightsVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 13/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

class GetActVo: Mappable {
    
    //MARK:-  Declaration of GetActVo

    var RoleId: String?
    var ActivityRightId: String?
    var CreatedByUserId: String?
    var CreatedDate: String?
    var UpdatedByUserId: Int?
    var UpdatedDate: String?
    
    //MARK:-  initialization of GetActVo

    init(RoleId:String?,ActivityRightId:String?,CreatedByUserId:String?,CreatedDate:String?,UpdatedByUserId:Int?,UpdatedDate:String?) {
        
        self.RoleId = RoleId
        self.ActivityRightId = ActivityRightId
        self.CreatedByUserId = CreatedByUserId
        self.CreatedDate = CreatedDate
        self.UpdatedByUserId = UpdatedByUserId!
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

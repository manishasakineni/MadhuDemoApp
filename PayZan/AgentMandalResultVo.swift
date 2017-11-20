//
//  AgentMandalResultVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 18/11/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation
class AgentMandalResultVo: Mappable {

//    {
//    "Code": "TEST",
//    "Name": "Test",
//    "IsCity": true,
//    "DistrictId": 1,
//    "Id": 5,
//    "IsActive": true,
//    "CreatedBy": "05e3b552-21f3-486f-9b6c-41cdf738f2b8",
//    "ModifiedBy": "05e3b552-21f3-486f-9b6c-41cdf738f2b8",
//    "Created": "2017-11-14T22:23:11.470599+00:00",
//    "Modified": "2017-11-14T22:23:11.470601+00:00"
//    }
    
    var Code: String?
    var Name: String?
    var IsCity: Bool?
    var DistrictId: Int?
    var Id: Int?
    var IsActive: Bool?
    
    
    init(IsCity:Bool?, DistrictId:Int?,Code:String?,Name:String?,Id:Int?,IsActive:Bool?) {
        
        
        self.IsCity = IsCity
        self.Code = Code
        self.Name = Name
        self.DistrictId = DistrictId
        self.Id = Id
        self.IsActive = IsActive
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        IsCity <- map["IsCity"]
        DistrictId <- map["DistrictId"]
        Code <- map["Code"]
        Name <- map["Name"]
        Id <- map["Id"]
        IsActive <- map["IsActive"]
        
    }
    
}

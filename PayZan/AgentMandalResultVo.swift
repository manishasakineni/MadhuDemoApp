//
//  AgentMandalResultVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 18/11/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

class AgentMandalResultVo: Mappable {

    //MARK:-  Declaration of AgentMandalResultVo
    
    var Code: String?
    var Name: String?
    var IsCity: Bool?
    var DistrictId: Int?
    var Id: Int?
    var IsActive: Bool?
    
    //MARK:-  initialization of AgentMandalResultVo

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

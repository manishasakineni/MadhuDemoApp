//
//  AgentVillageResultVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 18/11/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

class AgentVillageResultVo: Mappable {
    
//    {
//    "Code": "AMR",
//    "Name": "Ampara",
//    "MandalId": 4,
//    "PostCode": 30125,
//    "Id": 6,
//    "IsActive": true,
//    "CreatedBy": "05e3b552-21f3-486f-9b6c-41cdf738f2b8",
//    "ModifiedBy": null,
//    "Created": "2017-11-03T12:23:55.79936+00:00",
//    "Modified": "2017-11-03T12:23:13.301+00:00"
//    }
    
    var Code: String?
    var Name: String?
    var MandalId: Int?
    var PostCode: Int?
    var Id: Int?
    var IsActive: Bool?
    
    
    init(PostCode:Int?, MandalId:Int?,Code:String?,Name:String?,Id:Int?,IsActive:Bool?) {
        
        
        self.PostCode = PostCode
        self.Code = Code
        self.Name = Name
        self.MandalId = MandalId
        self.Id = Id
        self.IsActive = IsActive
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        PostCode <- map["PostCode"]
        MandalId <- map["MandalId"]
        Code <- map["Code"]
        Name <- map["Name"]
        Id <- map["Id"]
        IsActive <- map["IsActive"]
        
    }
    
}

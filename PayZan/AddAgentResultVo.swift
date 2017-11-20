//
//  AddAgentResultVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 18/11/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation


class AddAgentResultVo: Mappable {
    
    
//    "Result": {
//    "Id": 0,
//    "AgentRequestCategoryId": 38,
//    "TitleTypeId": 19,
//    "FirstName": "madhu",
//    "MiddleName": "babu",
//    "LastName": "pari",
//    "MobileNumber": "9885706781",
//    "Email": "madhubme020@gmail.com",
//    "AddressLine1": "knll",
//    "AddressLine2": "srinagar",
//    "Landmark": "hyd",
//    "VillageId": 6,
//    "Comments": "fgfgggggg",
//    "Created": "2017-11-18T01:40:24.0666951+05:30"
//    },
    
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

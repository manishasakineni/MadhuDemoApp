//
//  AgentReqResultVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 17/11/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation


class AgentReqResultVo: Mappable {
    
//    "CountryName": "Sri Lanka",
//    "Name": "Western",
//    "Code": "WSTRN",
//    "CountryId": 1,
//    "Id": 10,
//    "IsActive": true,
//    "CreatedBy": "05e3b552-21f3-486f-9b6c-41cdf738f2b8",
//    "ModifiedBy": "05e3b552-21f3-486f-9b6c-41cdf738f2b8",
//    "Created": "2017-11-06T05:49:58.857472+00:00",
//    "Modified": "2017-11-06T05:49:58.857469+00:00"
    
    var CountryName: String?
    var Name: String?
    var Code: String?
    var CountryId:Int?
    var Id: Int?
    
    
    init(CountryName:String?, Name:String?, Code:String?, CountryId:Int?,Id:Int) {
        
        self.CountryName = CountryName
        self.Name = Name
        self.Code = Code
        self.CountryId = CountryId
        self.Id = Id
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        CountryName <- map["CountryName"]
        Name <- map["Name"]
        Code <- map["Code"]
        CountryId <- map["CountryId"]
        Id <- map["Id"]
        
    }
    
}

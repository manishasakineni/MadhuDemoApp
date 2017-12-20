//
//  AgentReqResultVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 17/11/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation


class AgentReqResultVo: Mappable {
    
    //MARK:-  Declaration of AgentReqResultVo

    
    var CountryName: String?
    var Name: String?
    var Code: String?
    var CountryId:Int?
    var Id: Int?
    
    //MARK:-  initialization of AgentReqResultVo

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

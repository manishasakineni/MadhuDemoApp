//
//  AgentVillageResultVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 18/11/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

class AgentVillageResultVo: Mappable {
    
    //MARK:-  Declaration of AgentVillageResultVo

    
    var Code: String?
    var Name: String?
    var MandalId: Int?
    var PostCode: Int?
    var Id: Int?
    var IsActive: Bool?
    
    //MARK:-  initialization of AgentVillageResultVo

    
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

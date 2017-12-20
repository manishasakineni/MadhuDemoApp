//
//  AgentDistrictResultVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 17/11/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation


class AgentDistrictResultVo: Mappable {
    
    //MARK:-  Declaration of AgentDistrictResultVo
    
    var ProvinceName: String?
    var ProvinceId: Int?
    var CountryName: String?
    var CountryId: Int?
    var StateName: String?
    var Code: String?
    var Name: String?
    var StateId: Int?
    var Id: Int?
    var IsActive: Bool?
    
    //MARK:-  initialization of AgentDistrictResultVo

    
    init(ProvinceName:String?, ProvinceId:Int?, CountryName:String?, CountryId:Int?,StateName:String?,Code:String?,Name:String?,StateId:Int?,Id:Int?,IsActive:Bool?) {
        
        self.ProvinceName = CountryName
        self.ProvinceId = ProvinceId
        self.CountryName = CountryName
        self.CountryId = CountryId
        self.StateName = StateName
        self.Code = Code
        self.Name = Name
        self.StateId = StateId
        self.Id = Id
        self.IsActive = IsActive
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        ProvinceName <- map["ProvinceName"]
        ProvinceId <- map["ProvinceId"]
        CountryName <- map["CountryName"]
        CountryId <- map["CountryId"]
        StateName <- map["StateName"]
        Code <- map["Code"]
        Name <- map["Name"]
        StateId <- map["StateId"]
        Id <- map["Id"]
        IsActive <- map["IsActive"]
        
    }
    
}

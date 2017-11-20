//
//  AgentDistrictResultVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 17/11/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation


class AgentDistrictResultVo: Mappable {
    
//    "ListResult": [
//    {
//    "ProvinceName": "Western",
//    "ProvinceId": 10,
//    "CountryName": "Sri Lanka",
//    "CountryId": 1,
//    "StateName": "Default State",
//    "Code": "AMP",
//    "Name": "Amparara",
//    "StateId": 1,
//    "Id": 1,
//    "IsActive": false,
//    "CreatedBy": null,
//    "ModifiedBy": null,
//    "Created": "0001-01-01T00:00:00+00:00",
//    "Modified": "0001-01-01T00:00:00+00:00"
//    }
    
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

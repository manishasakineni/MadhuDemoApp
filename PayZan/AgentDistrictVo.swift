//
//  AgentDistrictVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 17/11/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation
//{
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
//    ],
//    "IsSuccess": true,
//    "AffectedRecords": 2,
//    "EndUserMessage": "Get All Successful",
//    "ValidationErrors": [],
//    "Exception": null
//}

class AgentDistrictVo: Mappable {
    
    var ListResult: [AgentDistrictResultVo]?
    var IsSuccess: Bool?
    var AffectedRecords: Int?
    var EndUserMessage: String?
    var ValidationErrors: Any?
    var Exception: Any?
    
    
    
    init(ListResult:[AgentDistrictResultVo]?, IsSuccess:Bool?,AffectedRecords:Int?, EndUserMessage:String?,ValidationErrors:Any?, Exception:Any?) {
        self.ListResult = ListResult
        self.IsSuccess = IsSuccess
        self.AffectedRecords = AffectedRecords
        self.EndUserMessage = EndUserMessage
        self.ValidationErrors = ValidationErrors
        self.Exception = Exception
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        ListResult <- map["ListResult"]
        IsSuccess <- map["IsSuccess"]
        AffectedRecords <- map["AffectedRecords"]
        EndUserMessage <- map["EndUserMessage"]
        ValidationErrors <- map["ValidationErrors"]
        Exception <- map["Exception"]
    }
}

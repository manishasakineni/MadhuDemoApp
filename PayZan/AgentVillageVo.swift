//
//  AgentVillageVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 18/11/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation
//{
//    "ListResult": [
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
//    ],
//    "IsSuccess": true,
//    "AffectedRecords": 1,
//    "EndUserMessage": "Get All Successful",
//    "ValidationErrors": [],
//    "Exception": null
//}

class AgentVillageVo: Mappable {
    
    var ListResult: [AgentVillageResultVo]?
    var IsSuccess: Bool?
    var AffectedRecords: Int?
    var EndUserMessage: String?
    var ValidationErrors: Any?
    var Exception: Any?
    
    
    
    init(ListResult:[AgentVillageResultVo]?, IsSuccess:Bool?,AffectedRecords:Int?, EndUserMessage:String?,ValidationErrors:Any?, Exception:Any?) {
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

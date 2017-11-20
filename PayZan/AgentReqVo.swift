//
//  AgentReqVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 17/11/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

//{
//    "ListResult": [
//    {
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
//    }
//    ],
//    "IsSuccess": true,
//    "AffectedRecords": 4,
//    "EndUserMessage": "Get All Successful",
//    "ValidationErrors": [],
//    "Exception": null
//}

class AgentReqVo: Mappable {
    
    var ListResult: [AgentReqResultVo]?
    var IsSuccess: Bool?
    var AffectedRecords: Int?
    var EndUserMessage: String?
    var ValidationErrors: Any?
    var Exception: Any?
    
    
    
    init(ListResult:[AgentReqResultVo]?, IsSuccess:Bool?,AffectedRecords:Int?, EndUserMessage:String?,ValidationErrors:Any?, Exception:Any?) {
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

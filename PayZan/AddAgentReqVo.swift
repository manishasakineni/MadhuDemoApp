//
//  AddAgentReqVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 18/11/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation
//{
//    "Result": {
//        "Id": 0,
//        "AgentRequestCategoryId": 38,
//        "TitleTypeId": 19,
//        "FirstName": "madhu",
//        "MiddleName": "babu",
//        "LastName": "pari",
//        "MobileNumber": "9885706781",
//        "Email": "madhubme020@gmail.com",
//        "AddressLine1": "knll",
//        "AddressLine2": "srinagar",
//        "Landmark": "hyd",
//        "VillageId": 6,
//        "Comments": "fgfgggggg",
//        "Created": "2017-11-18T01:40:24.0666951+05:30"
//    },
//    "IsSuccess": true,
//    "AffectedRecords": 1,
//    "EndUserMessage": "Record Saved Successfully",
//    "ValidationErrors": [],
//    "Exception": null
//}


class AddAgentReqVo: Mappable {
    
    var Result: [AddAgentResultVo]?
    var IsSuccess: Bool?
    var AffectedRecords: Int?
    var EndUserMessage: String?
    var ValidationErrors: Any?
    var Exception: Any?
    
    
    
    init(Result:[AddAgentResultVo]?, IsSuccess:Bool?,AffectedRecords:Int?, EndUserMessage:String?,ValidationErrors:Any?, Exception:Any?) {
        self.Result = Result
        self.IsSuccess = IsSuccess
        self.AffectedRecords = AffectedRecords
        self.EndUserMessage = EndUserMessage
        self.ValidationErrors = ValidationErrors
        self.Exception = Exception
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        Result <- map["Result"]
        IsSuccess <- map["IsSuccess"]
        AffectedRecords <- map["AffectedRecords"]
        EndUserMessage <- map["EndUserMessage"]
        ValidationErrors <- map["ValidationErrors"]
        Exception <- map["Exception"]
    }
}


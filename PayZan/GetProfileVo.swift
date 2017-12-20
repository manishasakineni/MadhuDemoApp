//
//  GetProfileVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 11/11/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

class GetProfileVo: Mappable {
    
    //MARK:-  Declaration of GetProfileVo

    
    var Result:ProfileResultVo?
    var IsSuccess:Bool?
    var AffectedRecords:Int?
    var EndUserMessage:String?
    var ValidationErrors:AnyObject?
    var Exception:Any?
    
    //MARK:-  initialization of GetProfileVo

    
    init(Result:ProfileResultVo?, IsSuccess:Bool?, AffectedRecords:Int?,EndUserMessage:String?,ValidationErrors:AnyObject?, Exception:Any?) {
        
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


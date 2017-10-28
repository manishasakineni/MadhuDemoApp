//
//  LoginResultVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 28/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

class LoginResultVo: Mappable {
    
    
    var Result:RespVo?
    var IsSuccess:Bool?
    var AffectedRecords:Int?
    var EndUserMessage:String?
    var ValidationErrors:AnyObject?
    var Exception:Any?
    
    
//    var User: RespVo?
//    var Roles:[RolesVo]?
//    var ActivityRights:[GetActVo]?
//    var UserWallet:GetUserWalletVo?
    
    init(Result:RespVo?, IsSuccess:Bool?, AffectedRecords:Int?,EndUserMessage:String?,ValidationErrors:AnyObject?, Exception:Any?) {
        
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

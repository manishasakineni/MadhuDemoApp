//
//  SignupVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 05/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

class SignupVo: Mappable {
    
    var Result: SignUpResultVo?
    var IsSuccess: Bool?
    var AffectedRecords: Int?
    
    init(Result:SignUpResultVo?,IsSuccess:Bool?,AffectedRecords:Int?) {
        self.Result = Result
        self.IsSuccess = IsSuccess
        self.AffectedRecords = AffectedRecords
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        Result <- map["Result"]
        IsSuccess <- map["IsSuccess"]
        AffectedRecords <- map["AffectedRecords"]
    }
}

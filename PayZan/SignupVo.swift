//
//  SignupVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 05/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

class SignupVo: Mappable {
    
    var StatusCode: Int?
    var StatusMessage: String?
    
    init(StatusCode:Int?,StatusMessage:String?) {
        self.StatusCode = StatusCode
        self.StatusMessage = StatusMessage
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        StatusCode <- map["StatusCode"]
        StatusMessage <- map["StatusMessage"]
    }
}

//
//  LoginVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 05/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation


class LoginVo: Mappable {
    
    //MARK:-  Declaration of LoginVo

    var StatusCode: Int?
    var data: UserVo?
    
    //MARK:-  initialization of LoginVo

    init(StatusCode:Int?, data:UserVo?) {
        self.StatusCode = StatusCode
        self.data = data
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        StatusCode <- map["StatusCode"]
        data <- map["data"]
    }
}


//
//  MyTransactionsVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 30/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation


class MyTransactionsVo: Mappable {
    
    //MARK:-  Declaration of MyTransactionsVo

    var ListResult: [MyTranListResultVo]?
    var IsSuccess: Bool?
    var AffectedRecords: Int?
    var EndUserMessage: String?
    var ValidationErrors: Any?
    var Exception: Any?
    
    //MARK:-  initialization of MyTransactionsVo

    
    init(ListResult:[MyTranListResultVo]?, IsSuccess:Bool?,AffectedRecords:Int?, EndUserMessage:String?,ValidationErrors:Any?, Exception:Any?) {
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




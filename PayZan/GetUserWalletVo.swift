//
//  GetUserWalletVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 14/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

class GetUserWalletVo: Mappable {
    
    var UserId: String?
    var WalletId: String?
    var Balance: Int?
    var Id: Int?
    var IsActive: Bool?
    var CreatedByUserId: String?
    var CreatedDate: String?
    var UpdatedByUserId: String?
    var UpdatedDate: String?
    
    init(UserId:String?,WalletId:String?,Balance:Int?,Id:Int?,IsActive:Bool?,CreatedByUserId:String?,CreatedDate:String?,UpdatedByUserId:String?,UpdatedDate:String?) {
        
        self.UserId = UserId
        self.WalletId = WalletId
        self.Balance = Balance
        self.Id = Id
        self.IsActive = IsActive!
        self.CreatedByUserId = CreatedByUserId
        self.CreatedDate = CreatedDate
        self.UpdatedByUserId = UpdatedByUserId
        self.UpdatedDate = UpdatedDate
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        UserId <- map["UserId"]
        WalletId <- map["WalletId"]
        Balance <- map["Balance"]
        Id <- map["Id"]
        IsActive <- map["IsActive"]
        CreatedByUserId <- map["CreatedByUserId"]
        CreatedDate <- map["CreatedDate"]
        UpdatedByUserId <- map["UpdatedByUserId"]
        UpdatedDate <- map["UpdatedDate"]
}
    
}

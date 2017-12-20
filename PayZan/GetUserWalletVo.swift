//
//  GetUserWalletVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 14/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

class GetUserWalletVo: Mappable {
    
    //MARK:-  Declaration of GetUserWalletVo

    var UserId: String?
    var WalletId: String?
    var Balance: Int?
    var Id: Int?
    var IsActive: Bool?
    var CreatedBy: String?
    var ModifiedBy: Any?
    var Created: String?
    var Modified: String?
    
    //MARK:-  initialization of GetUserWalletVo

    init(UserId:String?,WalletId:String?,Balance:Int?,Id:Int?,IsActive:Bool?,CreatedBy:String?,ModifiedBy:Any?,Created:String?,Modified:String?) {
        
        self.UserId = UserId
        self.WalletId = WalletId
        self.Balance = Balance
        self.Id = Id
        self.IsActive = IsActive!
        self.CreatedBy = CreatedBy
        self.ModifiedBy = ModifiedBy
        self.Created = Created
        self.Modified = Modified
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        UserId <- map["UserId"]
        WalletId <- map["WalletId"]
        Balance <- map["Balance"]
        Id <- map["Id"]
        IsActive <- map["IsActive"]
        CreatedBy <- map["CreatedBy"]
        ModifiedBy <- map["ModifiedBy"]
        Created <- map["Created"]
        Modified <- map["Modified"]
}
    
}

//
//  RespVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 05/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation


class RespVo: Mappable {
    
    //MARK:-  Declaration of RespVo

    var User:UserVo?
    var Roles:[RolesVo]?
    var ActivityRights:Any?
    var UserWallet:GetUserWalletVo?
    var AccessToken:String?
    var ExpiresIn:String?
    var TokenType:String?
    
    //MARK:-  initialization of RespVo

    init(User:UserVo?, Roles:[RolesVo]?, ActivityRights:Any?, UserWallet:GetUserWalletVo?, AccessToken:String?, ExpiresIn:String?, TokenType:String?) {
    
            self.User = User
            self.Roles = Roles
            self.ActivityRights = ActivityRights
            self.UserWallet = UserWallet
            self.AccessToken = AccessToken
            self.ExpiresIn = ExpiresIn
            self.TokenType = TokenType
    }
    
    required init?(map: Map) {
    
    }
    
    func mapping(map: Map) {
    
      User <- map["User"]
      Roles <- map["Roles"]
      ActivityRights <- map["ActivityRights"]
      UserWallet <- map["UserWallet"]
      AccessToken <- map["AccessToken"]
      ExpiresIn <- map["ExpiresIn"]
      TokenType <- map["TokenType"]
    
        }
    
    
    
    
}

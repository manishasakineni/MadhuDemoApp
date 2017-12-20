//
//  ProfileResultVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 11/11/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

class ProfileResultVo: Mappable {
    
    //MARK:-  Declaration of ProfileResultVo

    
    var UserName: String?
    var RoleIds: Any?
    var RoleNames: Any?
    var Title: Any?
    var GenderType: Any?
    var VillageName: String?
    var MandalId: Int?
    var MandalName: String?
    var DistrictId: Int?
    
    var DistrictName: String?
    var ProvinceId: Int?
    var ProvinceName: String?
    var CountryId: Int?
    var CountryName: String?
    var ParentAspNetUserName: String?
    var ParentAspNetUserFirstName: String?
    var ParentAspNetUserMidlleName: String?
    var ParentAspNetUserLastName: String?
    
    var PostCode: Int?
    var AspNetUserId: Int?
    var TitleTypeId: Int?
    var FirstName: String?
    var MiddleName: String?
    var LastName: String?
    var Phone: String?
    var Email: String?
    var GenderTypeId: Int?
    
    var DOB: String?
    var Address1: String?
    var Address2: String?
    var Landmark: String?
    var VillageId: Int?
    var ParentAspNetUserId: Int?
    var Id: Int?
    var IsActive: Bool?
    var CreatedBy: String?
    
    var ModifiedBy: String?
    var Created: String?
    var Modified: String?
    
    //MARK:-  initialization of ProfileResultVo

    
    init(UserName:String?,RoleIds:Any?,RoleNames:Any?,Title:Any?,GenderType:Any?,VillageName:String?,MandalId:Int?,MandalName:String?,DistrictId:Int?,DistrictName:String?,ProvinceId:Int?,ProvinceName:String?,CountryId:Int?,CountryName:String?,ParentAspNetUserName:String?,ParentAspNetUserFirstName:String?,ParentAspNetUserMidlleName:String?,ParentAspNetUserLastName:String?,PostCode:Int?,AspNetUserId:Int?,TitleTypeId:Int?,FirstName:String?,MiddleName:String?,LastName:String?,Phone:String?,Email:String?,GenderTypeId:Int?,DOB:String?,Address1:String?,Address2:String?,Landmark:String?,VillageId:Int?,ParentAspNetUserId:Int?,Id:Int?,IsActive:Bool?,CreatedBy:String?,ModifiedBy:String?,Created:String?,Modified:String?) {
        
        self.UserName = UserName
        self.RoleIds = RoleIds
        self.RoleNames = RoleNames
        self.Title = Title
        self.GenderType = GenderType!
        self.VillageName = VillageName
        self.MandalId = MandalId
        self.MandalName = MandalName
        self.DistrictId = DistrictId
        self.DistrictName = DistrictName
        self.ProvinceId = ProvinceId
        self.ProvinceName = ProvinceName
        self.CountryId = CountryId
        self.CountryName = CountryName!
        self.ParentAspNetUserName = ParentAspNetUserName
        self.ParentAspNetUserFirstName = ParentAspNetUserFirstName
        self.ParentAspNetUserMidlleName = ParentAspNetUserMidlleName
        self.ParentAspNetUserLastName = ParentAspNetUserLastName
        
        self.PostCode = PostCode
        self.AspNetUserId = AspNetUserId
        self.TitleTypeId = TitleTypeId
        self.FirstName = FirstName
        self.MiddleName = MiddleName!
        self.LastName = LastName
        self.Phone = Phone
        self.Email = Email
        self.GenderTypeId = GenderTypeId
        self.DOB = DOB
        self.Address1 = Address1
        self.Address2 = Address2
        self.Landmark = Landmark
        self.VillageId = VillageId!
        self.ParentAspNetUserId = ParentAspNetUserId
        self.Id = Id
        self.IsActive = IsActive
        self.CreatedBy = CreatedBy
        self.ModifiedBy = ModifiedBy
        self.Created = Created
        self.Modified = Modified
        
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        UserName <- map["UserName"]
        RoleIds <- map["RoleIds"]
        RoleNames <- map["RoleNames"]
        Title <- map["Title"]
        GenderType <- map["GenderType"]
        VillageName <- map["VillageName"]
        MandalId <- map["MandalId"]
        MandalName <- map["MandalName"]
        DistrictId <- map["DistrictId"]
        DistrictName <- map["DistrictName"]
        ProvinceId <- map["ProvinceId"]
        ProvinceName <- map["ProvinceName"]
        CountryId <- map["CountryId"]
        CountryName <- map["CountryName"]
        ParentAspNetUserName <- map["ParentAspNetUserName"]
        ParentAspNetUserFirstName <- map["ParentAspNetUserFirstName"]
        ParentAspNetUserMidlleName <- map["ParentAspNetUserMidlleName"]
        ParentAspNetUserLastName <- map["ParentAspNetUserLastName"]
        PostCode <- map["PostCode"]
        AspNetUserId <- map["AspNetUserId"]
        TitleTypeId <- map["TitleTypeId"]
        FirstName <- map["FirstName"]
        MiddleName <- map["MiddleName"]
        LastName <- map["LastName"]
        Phone <- map["Phone"]
        Email <- map["Email"]
        GenderTypeId <- map["GenderTypeId"]
        DOB <- map["DOB"]
        Address1 <- map["Address1"]
        Address2 <- map["Address2"]
        Landmark <- map["Landmark"]
        VillageId <- map["VillageId"]
        ParentAspNetUserId <- map["ParentAspNetUserId"]
        Id <- map["Id"]
        IsActive <- map["IsActive"]
        CreatedBy <- map["CreatedBy"]
        ModifiedBy <- map["ModifiedBy"]
        Created <- map["Created"]
        Modified <- map["Modified"]
        

    }
    
}

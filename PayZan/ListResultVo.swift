//
//  ListResultVo.swift
//  PayZan
//
//  Created by CalibrageMac02 on 16/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

class ListResultVo: Mappable {
    
    //MARK:-  Declaration of ListResultVo

    var Name: String?
    var Remarks: String?
    var FileName: String?
    var FileLocation: String?
    var FileExtension: String?
    var Id: Int?
    var IsActive: Bool?
    var CreatedBy: String?
    var ModifiedBy: String?
    var Created: String?
    var Modified: String?
    
    //MARK:-  initialization of ListResultVo

    
    init(Name:String?, Remarks:String?, FileName:String?, FileLocation:String?,FileExtension:String,Id:Int?,IsActive:Bool?,CreatedBy:String?,ModifiedBy:String?,Created:String?,Modified:String?) {
        
        self.Name = Name
        self.Remarks = Remarks
        self.FileName = FileName
        self.FileLocation = FileLocation
        self.FileExtension = FileExtension
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
        
        Name <- map["Name"]
        Remarks <- map["Remarks"]
        FileName <- map["FileName"]
        FileLocation <- map["FileLocation"]
        FileExtension <- map["FileExtension"]
        Id <- map["Id"]
        IsActive <- map["IsActive"]
        CreatedBy <- map["CreatedBy"]
        ModifiedBy <- map["ModifiedBy"]
        Created <- map["Created"]
        Modified <- map["Modified"]
        
    }
    
    
    
}

//
//  URLStrings.swift
//  PayZan
//
//  Created by CalibrageMac02 on 09/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

enum PayZanServices:Int {
    case Bank = 1
    case Services
    case AgentType
    case TitleType
    case Gender
    case FileType
    case PersonalIdProofType
    case FinancialIdProofType
    case TransactionType
    case TransactionReasonType
    case AgentRequestCategory
}


let loginUrl:String = baseUrl.appending("Register/Login")

let registerUrl:String = baseUrl.appending("Register/Register")



//let operatorUrl:String = "http://payzandev.azurewebsites.net/api/ServiceProvider/GetServiceProviders/null"

let operatorUrl:String = baseUrl.appending("ServiceProvider/GetServiceProviders/null")

let prepaidUrl:String = baseUrl.appending("ServiceProvider/GetServiceProvidersByServiceType/7")

let postpaidUrl:String = baseUrl.appending("ServiceProvider/GetServiceProvidersByServiceType/8")

let electricityUrl:String = baseUrl.appending("ServiceProvider/GetServiceProvidersByServiceType/9")

let waterUrl:String = baseUrl.appending("ServiceProvider/GetServiceProvidersByServiceType/10")

let broadbandUrl:String = baseUrl.appending("ServiceProvider/GetServiceProvidersByServiceType/11")

let dthUrl:String = baseUrl.appending("ServiceProvider/GetServiceProvidersByServiceType/12")

let insuranceUrl:String = baseUrl.appending("ServiceProvider/GetServiceProvidersByServiceType/13")

let cableTvUrl:String = baseUrl.appending("ServiceProvider/GetServiceProvidersByServiceType/42")

let landlineUrl:String = baseUrl.appending("ServiceProvider/GetServiceProvidersByServiceType/41")

let datacardUrl:String = baseUrl.appending("ServiceProvider/GetServiceProvidersByServiceType/40")

let districtUrl:String = baseUrl.appending("Districts/GetAll")

let walletUrl:String = baseUrl.appending("UserWallet/AddMoneyToUserWallet")

let sendWalletUrl:String = baseUrl.appending("UserWallet/SendMoneyToUserWallet")

let myTransactionsUrl:String = baseUrl.appending("UserWallet/GetPassbookDetails")

let getProfileUrl:String = baseUrl.appending("UserInfo/GetUserPersonalInfo/")

let profileUpdateUrl:String = baseUrl.appending("UserInfo/UpdateUserPersonalInfo")


let PROVINCE_API            =  baseUrl + "Province/GetProvinces/null"
let DISTRICTS_API           =  baseUrl + "Province/GetDistrictsByProvinceId/"
let MANDALS_API             =  baseUrl + "Mandals/GetMandalByDistrict/"
let VILLAGES_API            =  baseUrl + "Villages/GetVillageByMandal/"

let ADDAGENT_API            =  baseUrl + "AgentRequestInfo/AddAgentRequestInfo"



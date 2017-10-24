//
//  Constants.swift
//  PayZan
//
//  Created by CalibrageMac02 on 09/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation


//let baseUrl:String = "http://payzandev.azurewebsites.net/api/Account/"
let baseUrl:String = "http://192.168.1.125/PayZanAPI/api/"

//let baseUrl:String = "http://payzandev.azurewebsites.net/api/Register/"

let walletUrl:String = "http://192.168.1.125/PayZanAPI/api/UserWallet/AddMoneyToUserWallet"

//let operatorUrl:String = "http://payzandev.azurewebsites.net/api/ServiceProvider/GetServiceProviders/null"

let operatorUrl:String = "http://192.168.1.125/PayZanAPI/api/ServiceProvider/GetServiceProviders/null"

//let prepaidUrl:String = "http://payzandev.azurewebsites.net/api/ServiceProvider/GetServiceProvidersByServiceType/7"
let prepaidUrl:String = "http://192.168.1.125/PayZanAPI/api/ServiceProvider/GetServiceProvidersByServiceType/7"
//let postpaidUrl:String = "http://payzandev.azurewebsites.net/api/ServiceProvider/GetServiceProvidersByServiceType/8"
let postpaidUrl:String = "http://192.168.1.125/PayZanAPI/api/ServiceProvider/GetServiceProvidersByServiceType/8"

let kNetworkStatusMessage = "Please check your internet connection!"

let kToastDuration  = 5.0

let kRequestTimedOutMessage = "The request timed out."

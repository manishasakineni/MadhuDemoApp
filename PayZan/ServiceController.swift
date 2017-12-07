//
//  ServiceController.swift
//  PayZan
//
//  Created by CalibrageMac02 on 09/10/17.
//  Copyright © 2017 CalibrageMac02. All rights reserved.
//

import Foundation

let reachability = Reachability()!
var appDelegate = AppDelegate()

let content_type = "application/json; charset=utf-8"

class ServiceController: NSObject {
    
    func requestGETURL(strURL:String,success:@escaping(_ _result:AnyObject)->Void,failure:@escaping(_ _error:NSError) -> Void) {
        
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        if appDelegate.checkInternetConnectivity() == false
        {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration: kToastDuration, position: CSToastPositionBottom)
            return
        }
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        MBProgressHUD.hide(for:appDelegate.window,animated:true)
        MBProgressHUD.showAdded(to:appDelegate.window,animated:true)
        
        
        let request = NSMutableURLRequest(url: NSURL(string: strURL)! as URL)
        request.addValue(content_type, forHTTPHeaderField: "Content-Type")
        request.addValue(content_type, forHTTPHeaderField: "Accept")
        //// request.setValue(api_key, forHTTPHeaderField: "api_key")
        //        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        //        request.setValue("Keep-Alive", forHTTPHeaderField: "Connection")
        request.httpMethod = "GET"
        
        let defaults = UserDefaults.standard
        
        if let authToken = defaults.string(forKey: accessToken) {
            
            request.setValue("Bearer" + " " + authToken,forHTTPHeaderField: "Authorization")
            
        }
        
        
        let task = URLSession.shared.dataTask(with:request as URLRequest){(data,response,error) in
            DispatchQueue.main.async(){
                MBProgressHUD.hide(for:appDelegate.window,animated:true)
                
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("statusCode:\(statusCode)")
                
                if statusCode == 401 {
                    
                    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    
                    let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.window?.rootViewController = viewController
                    
                }
               else if error != nil
                {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    failure(error! as NSError)
                }else{
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    
                    do{
                        let parsedData = try JSONSerialization.jsonObject(with:data!,options:.mutableContainers) as![String:Any]
                        print(parsedData)
                        success(parsedData as AnyObject)
                    }
                    catch{
                        print("error=\(error)")
                        return
                    }
                    
                }
            }
        }
        task.resume()
    }
    
    
    func requestPOSTURL(strURL:NSString,postParams:NSDictionary,postHeaders:NSDictionary,successHandler:@escaping(_ _result:Any)->Void,failureHandler:(_ _error:NSError)->Void) -> Void {
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        if appDelegate.checkInternetConnectivity() == false {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            appDelegate.window?.makeToast(kNetworkStatusMessage,duration:kToastDuration,position:CSToastPositionBottom)
            return
        }
        MBProgressHUD.hide(for:appDelegate.window,animated:true)
        MBProgressHUD.showAdded(to:appDelegate.window,animated:true)
        
        let urlStr:NSString = strURL.addingPercentEscapes(using:String.Encoding.utf8.rawValue)! as NSString
        let url: NSURL = NSURL(string: urlStr as String)!
        
        let request:NSMutableURLRequest = NSMutableURLRequest(url:url as URL)
        request.httpMethod = "POST"
        request.addValue("application/json",forHTTPHeaderField:"Content-Type")
        request.addValue("application/json",forHTTPHeaderField:"Accept")
        
        if postHeaders["Authorization"] != nil  {
//            request.addValue(postHeaders[kCustomer_id] as! String, forHTTPHeaderField: kCustomer_id)
//            request.addValue(postHeaders[tokenType + " " + accessToken] as! String, forHTTPHeaderField: "Authorization")
            
//            request.setValue(tokenType + " " + accessToken,forHTTPHeaderField: "Authorization")
            
        }
        
        let defaults = UserDefaults.standard
        
        if let authToken = defaults.string(forKey: accessToken) {
            
            request.setValue("Bearer" + " " + authToken,forHTTPHeaderField: "Authorization")
            
        }
        
        do {
            let data = try! JSONSerialization.data(withJSONObject:postParams, options:.prettyPrinted)
            let dataString = String(data: data, encoding: String.Encoding.utf8)!
            
            let headerData = try! JSONSerialization.data(withJSONObject:postHeaders, options:.prettyPrinted)
            let headerDataString = String(data: headerData, encoding: String.Encoding.utf8)!
            
            print("Request Url :\(url)")
            print("Request Header Data :\(headerDataString)")
            print("Request Data : \(dataString)")
            
            request.httpBody = data
            // do other stuff on success
            
        }
        catch {
            DispatchQueue.main.async(){
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                MBProgressHUD.hide(for: appDelegate.window, animated: true)
                print("JSON serialization failed:  \(error)")
                appDelegate.window?.makeToast(error.localizedDescription, duration:kToastDuration , position:CSToastPositionCenter)
            }
        }
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {(data, response, error) in
            
//            print(data)
//            print(response)
//            print(error)
            
            DispatchQueue.main.async(){
                
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
                MBProgressHUD.hide(for: appDelegate.window, animated: true)
                
                
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("statusCode:\(statusCode)")
                
                if statusCode == 401 {
                    
                    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    
                    let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.window?.rootViewController = viewController
                    
                }
                
                if error != nil
                {
                    print("error=\(String(describing: error))")
                    appDelegate.window?.makeToast(kRequestTimedOutMessage, duration:kToastDuration , position:CSToastPositionCenter)
                    return
                    
                }
                do {
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options:.mutableContainers) as! [String:Any]
                    print(parsedData)
                    successHandler(parsedData as AnyObject)
                    
                } catch let error as NSError {
                    
                    print("error=\(error)")
                    appDelegate.window?.makeToast((error.localizedDescription) as String, duration:kToastDuration , position:CSToastPositionCenter)
                    return
                }
            }
        }
        task.resume()
        
    }
    
}

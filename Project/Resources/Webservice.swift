//
//  Webservice.swift
//  Project
//
//  Created by Sina on 9/16/18.
//  Copyright © 2018 SinaRan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias CompletionHandler = (_ success:Bool,_ statusCode:Int ,_ json:JSON?,_ jsonString:String?) -> Void
struct Webservice {
    static let base = "https://mock-api-mobile.dev.lalamove.com"
    static let deliveries = "\(base)/deliveries"
    
    static func sharedManager()->SessionManager{
        struct singletone {
            static let sharedManager: SessionManager = {
                let configuration = URLSessionConfiguration.default
                configuration.timeoutIntervalForRequest = 60
                configuration.timeoutIntervalForResource = 60
                return Alamofire.SessionManager(configuration: configuration)
            }()
        }
        return singletone.sharedManager
    }
    static func serverRequest(url:String,method:HTTPMethod = .get,params:[String:Any]?,encoding:ParameterEncoding=URLEncoding.default,_ completionHandler:@escaping CompletionHandler){
        Webservice.sharedManager().request(url, method: method ,parameters:params,encoding:encoding).responseJSON { response in
            if response.response != nil {
                if response.response!.statusCode == 200 {
                    if let json = response.result.value {
                        let j = JSON(json)
                        completionHandler(true, response.response!.statusCode,j,j.rawString())
                    }
                    else {
                        completionHandler(false, response.response!.statusCode,nil,nil)
                    }
                }
                else {
                    completionHandler(false, response.response!.statusCode,nil,nil)
                }
            }
            else {
                completionHandler(false,0,nil,nil)
            }
        }
    }
}

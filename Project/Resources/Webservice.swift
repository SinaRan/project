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
    
    
    /// This function create a session manager from Alamofire with custom settings.
    ///
    /// - Returns: A shared manager created from Alamofire.
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
    
    /// This function sends request to server and decide if request is a success or not.
    ///
    /// - Parameters:
    ///   - url: A URL which request sends to.
    ///   - method: HTTP Method which api accepts. eg. post,get,patch and ...
    ///   - params: Parameters which attachs to request.
    ///   - encoding: An encoding which shows how parameters should send. eg. If parameters needs to send as a query string in post use URLEncoding.queryString.
    ///   - completionHandler: A completion handler which returns (success,statusCode,json and jsonString) of a request.
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

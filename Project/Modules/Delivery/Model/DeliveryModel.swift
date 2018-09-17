//
//  DeliveryModel.swift
//  Project
//
//  Created by Sina on 9/16/18.
//  Copyright © 2018 SinaRan. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

struct DeliveryModel {
    var id:Int!
    var description:String!
    var imageUrl:String!
    var location:LocationModel!
    
    weak var delegate:DeliveryModelDataSource?
    
    init(){}
    
    func fetchDeliveries(offset:Int=0,limit:Int=20){
        let param = ["offset":offset,"limit":limit]
        Webservice.serverRequest(url: Webservice.deliveries, method: HTTPMethod.get, params: param) { (success, statusCode, json, jsonString) in
            if success {
                guard let j = json else {return}
                var array = [DeliveryModel]()
                for i in j {
                    array.append(self.jsonParser(json: i.1))
                }
                self.delegate?.didFetchDeliveries(success: success, items: array,jsonString: jsonString!)
            }
            else {
                self.delegate?.didFetchDeliveries(success: success, items: [DeliveryModel](),jsonString: "")
            }
        }
    }
    
    func jsonParser(json:JSON)->DeliveryModel{
        var model = DeliveryModel()
        model.id = json["id"].intValue
        model.description = json["description"].stringValue
        model.imageUrl = json["imageUrl"].stringValue
        let lModel = LocationModel()
        model.location = lModel.jsonParser(json: json["location"])
        return model
    }
}

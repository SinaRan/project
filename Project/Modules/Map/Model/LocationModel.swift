//
//  LocationModel.swift
//  Project
//
//  Created by Sina on 9/16/18.
//  Copyright © 2018 SinaRan. All rights reserved.
//

import Foundation
import SwiftyJSON

struct LocationModel {
    var lat:Double!
    var lng:Double!
    var address:String!
    init(){}
    init(lat:Double,lng:Double,address:String) {
        self.lat = lat
        self.lng = lng
        self.address = address
    }
    func jsonParser(json:JSON)->LocationModel{
        return LocationModel(lat: json["lat"].doubleValue, lng: json["lng"].doubleValue, address: json["address"].stringValue)
    }
}

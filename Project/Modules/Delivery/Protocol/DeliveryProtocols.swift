//
//  DeliveryProtocols.swift
//  Project
//
//  Created by Sina on 9/16/18.
//  Copyright © 2018 SinaRan. All rights reserved.
//

import Foundation


protocol DeliveryModelDataSource:AnyObject {
    func didFetchDeliveries(success:Bool,items:[DeliveryModel])
}

protocol DeliveryInteractorDatasource:AnyObject {
    func didFetchDeliveries(success:Bool,items:[DeliveryModel])
}

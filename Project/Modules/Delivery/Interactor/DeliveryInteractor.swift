//
//  DeliveryInteractor.swift
//  Project
//
//  Created by Sina on 9/16/18.
//  Copyright © 2018 SinaRan. All rights reserved.
//

import Foundation


class DeliveryInteractor:DeliveryModelDataSource {
    
    weak var delegate:DeliveryInteractorDatasource?
    
    func fetchDeliveries(){
        var model = DeliveryModel()
        model.delegate = self
        model.fetchDeliveries()
    }
    
    func didFetchDeliveries(success: Bool, items: [DeliveryModel]) {
        if success {
            delegate?.didFetchDeliveries(success: success, items: items)
        }
    }
}

//
//  DeliveryInteractor.swift
//  Project
//
//  Created by Sina on 9/16/18.
//  Copyright © 2018 SinaRan. All rights reserved.
//

import Foundation
import SwiftyJSON

class DeliveryInteractor:DeliveryModelDataSource {
    
    weak var delegate:DeliveryInteractorDatasource?
    
    /// This function ask DeliveryModel to fetch list of deliveries
    func fetchDeliveries(){
        var model = DeliveryModel()
        model.delegate = self
        model.fetchDeliveries()
    }
    
    /// This is DeliveryModel's answer, if its a success caches the response otherwise loads data from cache if available.
    ///
    /// - Parameters:
    ///   - success: Status of request.
    ///   - items: List of deliveries.
    ///   - jsonString: A string which saves on file if success is true.
    func didFetchDeliveries(success: Bool, items: [DeliveryModel],jsonString:String) {
        if success {
            cache(jsonString: jsonString)
            delegate?.didFetchDeliveries(success: success, items: items)
        }
        else {
            let model = DeliveryModel()
            var array = [DeliveryModel]()
            if let j = FileManagement.readFromFile(file: "Deliveries") {
                
                let json = JSON(j.data(using: String.Encoding.utf8))
                for i in json{
                    array.append(model.jsonParser(json: i.1))
                }
            }
            delegate?.didFetchDeliveries(success: success, items: array)
        }
    }
    
    /// This private function writes string to `Deliveries` file.
    ///
    /// - Parameter jsonString: A string which saves on file.
    private func cache(jsonString:String){
        FileManagement.writeOnFile(file: "Deliveries", data: jsonString)
    }
}

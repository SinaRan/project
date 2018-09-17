//
//  MapController.swift
//  Project
//
//  Created by Sina on 9/16/18.
//  Copyright © 2018 SinaRan. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapVC: UIViewController {
    var map:MKMapView!
    var closeBtn:UIButton!
    
    weak var delegate:MapDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Adds map to view
        map = MKMapView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 300))
        map.layer.cornerRadius = 10
        map.layer.masksToBounds = true
        self.view.addSubview(map)
        self.view.backgroundColor = UIColor.white
        
        // Adds close button to view
        closeBtn = UIButton(frame: CGRect(x: view.frame.width-28, y: 8, width: 20, height: 20))
        closeBtn.setTitle("X", for: UIControlState.normal)
        closeBtn.addTarget(self, action: #selector(close), for: UIControlEvents.touchUpInside)
        closeBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        self.view.addSubview(closeBtn)
    }
    
    func addAnnotation(model:DeliveryModel){
        let annotation = MKPointAnnotation()
        annotation.title = model.description
        annotation.coordinate = CLLocationCoordinate2D(latitude: model.location.lat, longitude: model.location.lng)
        map.addAnnotation(annotation)
        let span = MKCoordinateSpanMake(0.03, 0.03)
        map.setRegion(MKCoordinateRegion(center: annotation.coordinate, span: span), animated: true)
    }
    @objc func close(){
        map.removeAnnotations(map.annotations)
        delegate?.didCloseMap()
    }
}

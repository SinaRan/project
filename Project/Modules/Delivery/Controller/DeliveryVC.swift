//
//  DeliveryController.swift
//  Project
//
//  Created by Sina on 9/16/18.
//  Copyright © 2018 SinaRan. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class DeliveryVC: UIViewController,DeliveryInteractorDatasource {
    var interactor = DeliveryInteractor()
    var table:UITableView!
    var items = [DeliveryModel]()
    var mapView:UIView!
    let mapViewContorller = MapVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.delegate = self
        interactor.fetchDeliveries()
        initialViews()
    }
    
    func initialViews(){
        initialTable()
        initialMapView()
    }
    func initialMapView(){
        mapView = UIView(frame: CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: 300))
        mapView.layer.cornerRadius = 10
        mapView.layer.masksToBounds = true
        mapView.addSubview(mapViewContorller.view)
    }
    func initialTable(){
        table = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height) , style: UITableViewStyle.plain)
        table.delegate = self
        table.dataSource = self
        self.view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = true
        table.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        table.autoresizingMask = [UIViewAutoresizing.flexibleLeftMargin, UIViewAutoresizing.flexibleRightMargin, UIViewAutoresizing.flexibleTopMargin, UIViewAutoresizing.flexibleBottomMargin]
        table.estimatedRowHeight = 166
        table.register(DeliveryCell.self, forCellReuseIdentifier: "cell")
    }
    func didFetchDeliveries(success: Bool, items: [DeliveryModel]) {
        if success {
            if success {
                self.items = items
                self.table.reloadData()
            }
        }
    }
}

extension DeliveryVC:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DeliveryCell
        cell.cellImage.kf.setImage(with: URL(string: items[indexPath.row].imageUrl))
        cell.cellTitle.text = items[indexPath.row].description
        cell.cellDescription.text = items[indexPath.row].location.address
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.view.addEfectView()
        navigationController?.view.addSubview(mapView)
        mapViewContorller.addAnnotation(model: items[indexPath.row])
        UIView.animate(withDuration: 0.2, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.mapView.transform = CGAffineTransform(translationX: 0, y: -290)
        }) { (_) in
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
}

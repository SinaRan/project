//
//  DeliveryCell.swift
//  Project
//
//  Created by Sina on 9/16/18.
//  Copyright © 2018 SinaRan. All rights reserved.
//

import Foundation
import UIKit


class DeliveryCell: UITableViewCell {
    var cellImage:UIImageView!
    var cellTitle:UILabel!
    var cellDescription:UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // ImageView settings
        cellImage = UIImageView(frame: CGRect(x: 8, y: 8, width: 60, height: 60))
        cellImage.layer.cornerRadius = 5
        cellImage.layer.masksToBounds = true
        self.addSubview(cellImage)
        
        // Title settings
        cellTitle = UILabel(frame: CGRect(x: 76, y: 8, width: self.frame.width-84, height: 20))
        self.addSubview(cellTitle)
        
        // Description settings
        cellDescription = UILabel(frame: CGRect(x: 76, y: 38, width: self.frame.width-84, height: 20))
        cellDescription.textColor = UIColor.lightGray
        cellDescription.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(cellDescription)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  ViewExtensions.swift
//  Project
//
//  Created by Sina on 9/16/18.
//  Copyright © 2018 SinaRan. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addEfectView(){
        let effectView = UIView(frame: self.frame)
        effectView.backgroundColor = UIColor.darkGray
        effectView.alpha = 0.3
        effectView.tag = 1001
        self.addSubview(effectView)
    }
    func removeEffectView(){
        for i in self.subviews {
            if let blurView = i.viewWithTag(1001) {
                blurView.removeFromSuperview()
            }
        }
    }
}

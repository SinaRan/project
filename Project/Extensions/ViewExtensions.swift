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
    
    /// This function adds an effect on top of self(View).
    func addEfectView(){
        let effectView = UIView(frame: self.frame)
        effectView.backgroundColor = UIColor.darkGray
        effectView.alpha = 0.3
        effectView.tag = 1001
        self.addSubview(effectView)
    }
    
    /// This function removes particular effect(With tag 1001) from self(View).
    func removeEffectView(){
        for i in self.subviews {
            if let blurView = i.viewWithTag(1001) {
                blurView.removeFromSuperview()
            }
        }
    }
}

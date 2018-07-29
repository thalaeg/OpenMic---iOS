//
//  UIViewExtensions.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/18/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

extension UIView {
    
    func addBottomBorder() {
        let bottomLayter = CALayer()
        bottomLayter.frame = CGRect(x: 0, y: self.frame.height - 1, width: self.frame.width, height: 1)
        bottomLayter.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
        self.layer.addSublayer(bottomLayter)
        
    }
    
    
    func addtopBorder() {
        let topLayer = CALayer()
        topLayer.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 1)
        topLayer.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
        self.layer.addSublayer(topLayer)
    }
    
 

}

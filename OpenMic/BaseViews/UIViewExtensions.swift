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
        bottomLayter.backgroundColor = UIColor(white: 1.0, alpha: 1.0).cgColor
        self.layer.addSublayer(bottomLayter)
        
    }
    
 

}

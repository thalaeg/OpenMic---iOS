//
//  ButtonStyleExtensions.swift
//  OpenMic
//
//  Created by Michael Metzger  on 8/5/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit


extension UIView {
    
    func redThenRoundBorder() {
        self.layer.borderColor = #colorLiteral(red: 0.9098039216, green: 0.1803921569, blue: 0.09803921569, alpha: 1)
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = self.frame.midY / 2
        
    }
    
    func roundBorderless() {
        self.layer.cornerRadius = self.frame.midY / 2
        
    }
    
    func addBlueEffect() {
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            self.backgroundColor = .clear
            
            let blurEffect = UIBlurEffect(style: .dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            //always fill the view
            blurEffectView.frame = self.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            self.insertSubview(blurEffectView, at: 0)
        } else {
            self.backgroundColor = .black
        }
    }
    
    
}

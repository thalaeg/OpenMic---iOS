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
    
    
    
    func redThenRoundBorder() {
        self.backgroundColor = UIColor.clear
        self.layer.borderColor = #colorLiteral(red: 0.9098039216, green: 0.1803921569, blue: 0.09803921569, alpha: 1)
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = self.frame.midY / 2
        
    }
    
    func roundBorderless2(){
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
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

//
//  ProfileEditGradientView.swift
//  OpenMic
//
//  Created by Michael Metzger  on 8/5/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

@IBDesignable
class ProfileEditGradientView: UIView {
    
    var gradientLayer = CAGradientLayer()
   
    
    
    private func AddGradient() {
        self.layer.insertSublayer(gradientLayer, at: 0)
        let startColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
        let endColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.anchorPoint = .zero
       
    
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        AddGradient()
        addBlueEffect()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.bounds = bounds
        AddGradient()
        addBlueEffect()
  
        
    }



}

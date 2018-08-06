//
//  OvalRedBorderButton.swift
//  OpenMic
//
//  Created by Michael Metzger  on 8/5/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit


@IBDesignable
class OvalRedBorderButton: UIButton {
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.redThenRoundBorder()
    }
    override func awakeFromNib() {
       self.redThenRoundBorder()
    }
    
    

  

}




@IBDesignable
class RoundedButtonIbinspectableRedBorder: UIButton {
    
    @IBInspectable var degrees: CGFloat = 1.0
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
       setBorder()
    }
    override func awakeFromNib() {
       setBorder()
    }
    
    
    func setBorder() {
        self.backgroundColor = UIColor.clear
        self.layer.borderColor = #colorLiteral(red: 0.9098039216, green: 0.1803921569, blue: 0.09803921569, alpha: 1)
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = degrees
    }
    
    
    
    
    
}

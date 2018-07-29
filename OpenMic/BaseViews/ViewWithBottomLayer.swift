//
//  ViewWithBottomLayer.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/18/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit
@IBDesignable
class ViewWithBottomLayer: UIView {
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addBottomBorder()
        self.addtopBorder()
    }



}

class ButtonWithBottomLayer: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addBottomBorder()
   
    }
}

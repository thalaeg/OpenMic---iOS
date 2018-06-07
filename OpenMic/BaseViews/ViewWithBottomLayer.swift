//
//  ViewWithBottomLayer.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/18/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class ViewWithBottomLayer: UIView {

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addBottomBorder()
        self.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
    }



}

class ButtonWithBottomLayer: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addBottomBorder()
   
    }
}

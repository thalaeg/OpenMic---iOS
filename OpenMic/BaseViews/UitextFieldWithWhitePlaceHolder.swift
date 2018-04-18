//
//  UitextFieldWithWhitePlaceHolder.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/18/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class UitextFieldWithWhitePlaceHolder: UITextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")

    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

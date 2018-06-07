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

        self.setValue(#colorLiteral(red: 0.4235294118, green: 0.4235294118, blue: 0.4235294118, alpha: 1), forKeyPath: "_placeholderLabel.textColor")

    }


}

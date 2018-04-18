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

        self.setValue(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), forKeyPath: "_placeholderLabel.textColor")

    }


}

//
//  CustomNavigationController.swift
//  OpenMic
//
//  Created by Michael Metzger  on 6/20/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.navigationBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
     
        
    }


}

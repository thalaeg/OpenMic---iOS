//
//  AlertViews .swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/17/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit


extension UIViewController {
    func standardAlertView(title: String, message: String) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertView, animated: true, completion: nil)
        
    }
}

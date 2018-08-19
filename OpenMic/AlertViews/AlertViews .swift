//
//  AlertViews .swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/17/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit
enum cameraType {
    case library
    case camera
}

extension UIViewController {
    func standardAlertView(title: String, message: String) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertView, animated: true, completion: nil)
        
    }
    
    
    func pickCameraTypeAlert(title: String, message: String,  completion: @escaping (_ cameraType: cameraType) -> Void) {
        
        let controller = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (_) in
            
            completion(.camera)
        }
        
        let LibraryAction = UIAlertAction(title: "Library", style: .default) { (_) in
            
            completion(.library)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        controller.addAction(cameraAction)
        controller.addAction(LibraryAction)
        controller.addAction(cancelAction)
        self.present(controller, animated: true, completion: nil)
        
    }
    
}

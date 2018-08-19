//
//  AddNewPhoto.swift
//  OpenMic
//
//  Created by Mike on 8/19/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit
import AVFoundation

class AddNewUserPhotoDelegate: NSObject {
    
    private var viewController: UIViewController
    private var controller = UIImagePickerController()
    
    init(viewController: UIViewController, sourceType: UIImagePickerControllerSourceType) {
        self.viewController = viewController
        super.init()
        controller.delegate = self
        controller.sourceType = sourceType
    }
    
}

extension AddNewUserPhotoDelegate: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private func requestAuthorization() {
        if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) == AVAuthorizationStatus.authorized {
            //launch camera
        }
        
         AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (response) in
            if response {
                //access granted
            } else {
                //no access
            }
        })
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }
    
}


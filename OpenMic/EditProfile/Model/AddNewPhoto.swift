//
//  AddNewPhoto.swift
//  OpenMic
//
//  Created by Mike on 8/19/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import Foundation
import UIKit

//Image Picker class
class ChooseImage: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    let picker = UIImagePickerController()
    var managedView: UIViewController
    
    var updatePhotoDelegate: UpDatePhotoDelegate?
    
    init(vc: UIViewController, source: UIImagePickerControllerSourceType) {
        self.managedView = vc
        super.init()
        picker.delegate = self
        picker.sourceType = source
        picker.allowsEditing = false
        
    }
    
    
    func presentView() {
        self.managedView.present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let imageTosend = info[UIImagePickerControllerOriginalImage] as? UIImage
        if let imagecheck = imageTosend {
            updatePhotoDelegate?.upDatePhoto(image: imagecheck)
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
}

protocol UpDatePhotoDelegate {
    func upDatePhoto(image: UIImage)
}

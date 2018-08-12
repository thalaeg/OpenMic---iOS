//
//  EditProfileDelegate.swift
//  OpenMic
//
//  Created by Mike on 8/12/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit


protocol EditUserAttributesDelegate {
    var viewController: UIViewController {get}
    var userName: String? {get set}
    var fullName: String? {get set}
    var bio: String? {get set}
    var location: String? {get set}
    
}

extension EditUserAttributesDelegate {
    
    
}

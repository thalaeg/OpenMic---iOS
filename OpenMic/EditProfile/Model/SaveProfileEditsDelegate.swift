//
//  SaveProfileEditsDelegate.swift
//  OpenMic
//
//  Created by Mike on 8/18/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import Foundation

protocol SaveProfileUpdatesDelegate {
    var currentUser: CurrentUser? {get}
    var userFullName: String? {get set}
    var username: String? {get set}
    var userBio: String? {get set}
    var userLocation: String? {get set}
    
    //MARK: to add user photo
    
    
}


extension SaveProfileUpdatesDelegate {

    
    
}

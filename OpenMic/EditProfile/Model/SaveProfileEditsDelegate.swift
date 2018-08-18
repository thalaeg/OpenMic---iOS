//
//  SaveProfileEditsDelegate.swift
//  OpenMic
//
//  Created by Mike on 8/18/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import Foundation

protocol SaveProfileUpdates {
    var currentUser: CurrentUser? {get}
    var userFullName: String {get}
    var username: String {get}
    var userBio: String {get}
    var userLocation: String {get}
    
    
}

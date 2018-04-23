//
//  CheckUserStatusProtocol.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/23/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import Foundation
import Firebase

protocol CheckUserStatusDataSource {
    func userStateChange(loggedIn: Bool)
    
}

extension CheckUserStatusDataSource {
    
    func listenForUserStateChange() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if auth.currentUser != nil {
                // User is signed in.
                self.userStateChange(loggedIn: true)
            } else {
                self.userStateChange(loggedIn: false)
            }

        }
    }
}


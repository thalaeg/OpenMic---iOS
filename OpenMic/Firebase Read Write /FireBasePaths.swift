//
//  FireBasePaths.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/16/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import Foundation
import Firebase

var baseURL: DatabaseReference {
    return Database.database().reference()
}

enum BasePaths: String {
    case users
    case uid
    case Genre
    case userDetails = "user_details"
    case savedPlatformLinks = "saved_platform_links"
    
    func getNonUIDBase() -> DatabaseReference {
       return baseURL.child(self.rawValue)
    }
    
    func getUIDBase() -> DatabaseReference? {
        
        guard let uid = Auth.auth().currentUser?.uid else {return nil}
        
        switch self {
        case .users:
            return baseURL.child(BasePaths.users.rawValue).child(uid)
        default:
            return baseURL.child(BasePaths.users.rawValue).child(uid).child(self.rawValue)
        }
        
        
        
        
    }
    
    
}

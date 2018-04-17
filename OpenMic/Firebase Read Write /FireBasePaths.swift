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
    
    func getNonUIDBase() -> DatabaseReference {
       return baseURL.child(self.rawValue)
    }
    
    
    
}

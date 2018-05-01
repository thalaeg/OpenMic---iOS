//
//  UserReadWrite.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/30/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import Foundation
import Firebase
import SwiftyJSON


struct CurrentUser {
    
    static func getUserID() -> String? {
        if let currentUser = Auth.auth().currentUser?.uid {
            return currentUser
        } else {
            return nil
        }
       
    }
    
    static func getallUserValuesDictionar(completion: @escaping (_ userFields: [String : String]) -> Void ) {
        if let userId = getUserID() {
            BasePaths.users.getNonUIDBase().child(userId).observeSingleEvent(of: .value) { (snapShot) in
                let userFields = snapShot.value as? [String : Any] ?? [:]
                let json = JSON(userFields)
                if let userdetailsDic = json[BasePaths.userDetails.rawValue].dictionaryObject, let stringDic = userdetailsDic as? [String : String] {
                    completion(stringDic)
                }
                
                
            }
        }
        
    }
    
    
}

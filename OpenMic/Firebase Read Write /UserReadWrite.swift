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
    
    enum userKeys: String {
        case username
        case profile_pic
        case biography
        
    }
    
    
    var userName: String
    var userBio: String
    var profilePic: String?
    
    init(userName: String, userBio: String, profilePic: String? ) {
        self.userName = userName
        self.userBio = userBio
        if let profilePic = profilePic {
            self.profilePic = profilePic
        }
    
    }
    
    init(json: Any) {
        let jsonInput = JSON(json)
        self.userName = jsonInput[userKeys.username.rawValue].stringValue
        self.userBio = jsonInput[userKeys.biography.rawValue].stringValue
        if let profilePic = jsonInput[userKeys.profile_pic.rawValue].string {
            self.profilePic = profilePic
        }
        
        
        
    }
    
    
    static func getUserID() -> String? {
        if let currentUser = Auth.auth().currentUser?.uid {
            return currentUser
        } else {
            return nil
        }
       
    }
    
//    static func getallUserValuesDictionar(completion: @escaping (_ userFields: [String : String]) -> Void ) {
//        if let userId = getUserID() {
//            BasePaths.users.getNonUIDBase().child(userId).observeSingleEvent(of: .value) { (snapShot) in
//                let userFields = snapShot.value as? [String : Any] ?? [:]
//                let json = JSON(userFields)
//                if let userdetailsDic = json[BasePaths.userDetails.rawValue].dictionaryObject, let stringDic = userdetailsDic as? [String : String] {
//                    completion(stringDic)
//                }
//
//
//            }
//        }
//
//    }
    
    
}

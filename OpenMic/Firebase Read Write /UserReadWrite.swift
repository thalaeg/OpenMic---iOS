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
        case last_name
        case first_name
        case followed_artists
        
    }
    
    
    var userName: String
    var userBio: String
    var profilePic: String?
    var followers = [String]()
    
    init(userName: String, userBio: String, profilePic: String? ) {
        self.userName = userName
        self.userBio = userBio
        if let profilePic = profilePic {
            self.profilePic = profilePic
        }
    
    }
    
    init(json: JSON) {
        
        self.userName = json[userKeys.username.rawValue].stringValue
        self.userBio = json[userKeys.biography.rawValue].stringValue
        if let profilePic = json[userKeys.profile_pic.rawValue].string {
            self.profilePic = profilePic
        }
        
        if let followers = json[userKeys.followed_artists.rawValue].arrayObject, let followersString = followers as? [String] {
            self.followers = followersString
        }
        
        
        
    }
    
    
    static func getUserID() -> String? {
        if let currentUser = Auth.auth().currentUser?.uid {
            return currentUser
        } else {
            return nil
        }
       
    }
    //MARK: Parse the current user from custom API
    static func getSingleUserfromAPI(compleetion: @escaping (_ currentUSer: CurrentUser) -> Void) {
        //get current user
        guard let path =  BasePaths.users.getUIDBase() else {return}
        path.observeSingleEvent(of: .value) { (snapShot) in
            let inputDict = snapShot.value as? [String : Any] ?? [:]
            let inputJSON = JSON(inputDict)
            let user = CurrentUser.init(json: inputJSON)
            
            Endpoints.addProfile.getCallWithAppenedURL(stringToAppend: user.userName, completion: { (error, json) in
                guard let inputDictionary = json else {return}
                let userFromApi = CurrentUser.init(json: JSON(inputDictionary))
                compleetion(userFromApi)
                
            })
            
            
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

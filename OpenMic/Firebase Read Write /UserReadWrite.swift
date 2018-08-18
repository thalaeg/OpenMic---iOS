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
        case location
        
    }
    
    
    var userName: String
    var userBio: String
    var profilePic: String?
    var followers = [String]()
    var firstName: String
    var lastName: String
    var bio: String?
    var location: String?
    
    
    
    init(userName: String, userBio: String, profilePic: String?, firstName: String, lastName: String, bio: String?, location: String?) {
        self.userName = userName
        self.userBio = userBio
        if let profilePic = profilePic {
            self.profilePic = profilePic
        }
        self.firstName = firstName
        self.lastName = lastName
        if let bio = bio {
            self.bio = bio
        }
        if let location = location {
            self.location = location
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
        
        self.firstName = json[userKeys.first_name.rawValue].stringValue
        self.lastName = json[userKeys.last_name.rawValue].stringValue
        self.bio = json[userKeys.biography.rawValue].stringValue
        self.location = json[userKeys.location.rawValue].stringValue
        
        
    }
    
    
    static func getUserID() -> String? {
        if let currentUser = Auth.auth().currentUser?.uid {
            return currentUser
        } else {
            return nil
        }
       
    }
    
    
    static func getCurrentUserfromFirebase(completion: @escaping (_ currentUSer: CurrentUser) -> Void) {
        
        guard let path =  BasePaths.users.getUIDBase() else {return}
        path.observeSingleEvent(of: .value) { (snapShot) in
            let inputDict = snapShot.value as? [String : Any] ?? [:]
            let inputJSON = JSON(inputDict)
            let user = CurrentUser.init(json: inputJSON)
            completion(user)
            
        }
        
    }
    
    //MARK: Parse the current user from custom API
    static func getSingleUserfromAPI(compleetion: @escaping (_ currentUSer: CurrentUser) -> Void) {
        //get current user
        
        self.getCurrentUserfromFirebase { (user) in
            Endpoints.addProfile.getCallWithAppenedURL(stringToAppend: user.userName, completion: { (error, json) in
                guard let inputDictionary = json else {return}
                let userFromApi = CurrentUser.init(json: JSON(inputDictionary))
                compleetion(userFromApi)
                
            })
        }
   
        
    }
    
    
    

    
    
}

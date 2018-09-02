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
    func updateUserParameters() {
        guard let currentUSer = self.currentUser,let userid = currentUser?.userID else {return}
        var params = self.getupDateParams()
        if params.count > 0 {
            params.updateValue(userid, forKey: CurrentUser.userKeys.firebaseId.rawValue)
            Endpoints.updateProfile.patchUser(with: params, currentUSer: currentUSer) { (response, error) in
                print("response \(response), error \(error)")
            }
        }
        
        
        
    }
    
    
    
    
    
    
    
    private func getupDateParams() -> [String : String] {
        
        var newParamDict = [String : String]()
        if let userFullName = self.userFullName {
            let firstAndLast = userFullName.getFIrstAndLast()
            newParamDict.updateValue(firstAndLast.first, forKey: CurrentUser.userKeys.first_name.rawValue)
            if let lastname = firstAndLast.last {
                newParamDict.updateValue(lastname, forKey: CurrentUser.userKeys.last_name.rawValue)
            }
        }
        
        if let username = self.username {
            newParamDict.updateValue(username, forKey: CurrentUser.userKeys.username.rawValue)
        }
        
        if let userBio = self.userBio {
            newParamDict.updateValue(userBio, forKey: CurrentUser.userKeys.biography.rawValue)
        }
        if let userLocation = self.userLocation {
            newParamDict.updateValue(userLocation, forKey: CurrentUser.userKeys.location.rawValue)
        }
        
        return newParamDict
    
    }
    
    
    
    
    
}

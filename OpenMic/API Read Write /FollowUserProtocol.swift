//
//  FollowUserProtocol.swift
//  OpenMic
//
//  Created by Michael Metzger  on 7/10/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import Foundation
import SwiftyJSON


protocol AddArtistDelegate {
    func artistAdded(success: Bool, message: String)
    
    
    
}

extension AddArtistDelegate {
    
    func addArtist(selectedArtist: CurrentUser) {
        
        CurrentUser.getSingleUserfromAPI { (user) in
            let parameters = ["user" : user.userName, "artist" : selectedArtist.userName ]
            let isAlreadySelected = user.followers.contains(selectedArtist.userName)
            switch isAlreadySelected {
            case true:
                self.removeFollowedArtist(parameters: parameters)
            case false:
                self.appendNewArtistToFollow(parameters: parameters)
            }
        }
    }
    
    
    private func removeFollowedArtist(parameters: [String : String]) {
        Endpoints.addArtist.deleteWithEncoding(with: parameters) { (json, error) in
            print("json \(json), error \(error)")
        
        }
        
    }
    
    private func appendNewArtistToFollow(parameters: [String : String]) {
        Endpoints.addArtist.postWithEncoding(with: parameters) { (json, error) in
            if let jsonAny = json {
                let jsonResult = JSON(jsonAny)
                let success = jsonResult["success"].stringValue
                let message = jsonResult["message"].stringValue
                
                if success == "True" {
                    self.artistAdded(success: true, message: message)
                } else {
                    self.artistAdded(success: false, message: message)
                }
                
            }
            
        }
        
    }

    
    
    
//    func addArtist(selectedArtist: CurrentUser) {
//        BasePaths.users.getUIDBase()?.observe(.value, with: { (snapShot) in
//            let inputDict = snapShot.value as? [String : Any] ?? [:]
//            let user = CurrentUser.init(json: JSON(inputDict))
//
//            let parameters = ["user" : user.userName, "artist" : selectedArtist.userName ]
//            Endpoints.addArtist.postWithEncoding(with: parameters) { (json, error) in
//                if let jsonAny = json {
//                    let jsonResult = JSON(jsonAny)
//                    let success = jsonResult["success"].stringValue
//                    let message = jsonResult["message"].stringValue
//
//                    if success == "True" {
//                        self.artistAdded(success: true, message: message)
//                    } else {
//                        self.artistAdded(success: false, message: message)
//                    }
//
//                }
//
//            }
//
//        })
//
//    }
    
}







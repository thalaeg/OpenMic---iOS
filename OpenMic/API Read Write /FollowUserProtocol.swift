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
        BasePaths.users.getUIDBase()?.observe(.value, with: { (snapShot) in
            let inputDict = snapShot.value as? [String : Any] ?? [:]
            let user = CurrentUser.init(json: JSON(inputDict))
            let parameters = ["user" : user.userName, "artist" : selectedArtist.userName ]
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
            
        })
        
    }
    
}







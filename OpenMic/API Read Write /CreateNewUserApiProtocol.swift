//
//  CreateNewUserApiProtocol.swift
//  OpenMic
//
//  Created by Michael Metzger  on 7/3/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import Foundation
import SwiftyJSON
import Firebase


protocol CreateNewUSerAPIDelegate {
    var userName: String {get}
    
    
}

extension CreateNewUSerAPIDelegate {
    
    func createNewUserOnApi() {
        guard let uid = Auth.auth().currentUser?.uid else {return}
       let path =  BasePaths.users.getNonUIDBase().child(uid)
        path.observeSingleEvent(of: .value, with: { (snapShot) in
            let outputDictionary = snapShot.value as? [String : Any] ?? [:]
            let json = JSON(outputDictionary)
            guard let userDetails = json[BasePaths.userDetails.rawValue].dictionaryObject else {return}
            
            var userDetailInput = userDetails
            userDetailInput.updateValue(self.userName, forKey: CurrentUser.userKeys.username.rawValue)
            //MARK: add DOB back in when api is updated
            userDetailInput.removeValue(forKey: "DOB")
            Endpoints.addProfile.postCall(with: userDetailInput, completionHandler: { (json, error) in
                
                if let error = error {
                    
                }
                
                if let json = json {
                    let jsonRead = JSON(json)
                    if let isSucess = jsonRead["success"].string {
                        if isSucess == "True" {
                            
                        }
                    }
                    
                }
                
            })
            
            //MARK: remove user values
            
        })
        
        
    }
    
    
    
}



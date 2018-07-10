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
    
    func createNewUserOnApi(completion: @escaping (_ success: Bool) -> Void) {
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
                
                if let _ = error {
                    completion(false)
                }
                
                if let json = json {
                    let jsonRead = JSON(json)
                    if let isSucess = jsonRead["success"].string {
                        if isSucess == "True" {
                            guard let userPath = BasePaths.users.getUIDBase() else { return }
                            userPath.child(CurrentUser.userKeys.username.rawValue).setValue(self.userName)
                            completion(true)
                        }
                    } else {
                        completion(false)
                    }
                    
                }
                
            })
            
            //MARK: remove user values
            
        })
        
        
    }
    
    
    
}



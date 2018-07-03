//
//  CreateNewUserApiProtocol.swift
//  OpenMic
//
//  Created by Michael Metzger  on 7/3/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import Foundation
import Firebase
import SwiftyJSON


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
            
            Endpoints.profiles.postCall(with: userDetails)
            
            
            
            
        })
        
        
    }
    
    
    
}



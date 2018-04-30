//
//  CreateNewUserProtocol.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/17/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit
import Firebase



protocol CreateUserDelegate {
    var viewController: UIViewController {get}
}
extension CreateUserDelegate {
    func createNewuser(email: String, password: String, additonalFields: [String: Any] ,completion: @escaping (_ error: Bool, _ user: User?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                completion(true, nil)
                self.viewController.standardAlertView(title: "error", message: error.localizedDescription)
            } else {
                guard let newUser = user else {return}
                BasePaths.users.getNonUIDBase().child(newUser.uid).child(BasePaths.uid.rawValue).setValue(newUser.uid)
                BasePaths.users.getNonUIDBase().child(newUser.uid).child(BasePaths.userDetails.rawValue).setValue(additonalFields)
                completion(false, newUser)
            }
        }
        
    }
    
    
    
    
}

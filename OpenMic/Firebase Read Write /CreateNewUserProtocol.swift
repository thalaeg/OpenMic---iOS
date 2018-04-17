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
    func createNewuser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                self.viewController.standardAlertView(title: "error", message: error.localizedDescription)
            } else {
                guard let newUser = user else {return}
                BasePaths.users.getNonUIDBase().childByAutoId().setValue([BasePaths.uid.rawValue : newUser.uid])
            }
        }
        
    }
}

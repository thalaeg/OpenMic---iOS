//
//  LoginUserProtocol.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/23/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit
import Firebase

protocol LogUserInDelegate {
    var email:String {get}
    var password: String {get}
    var viewController: UIViewController {get}
    
}

extension LogUserInDelegate {
    private func logUSerIn() {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                self.viewController.standardAlertView(title: "Error", message: error.localizedDescription)
            }
        }
    }
    
    func checkFieldsAndAuthenticate() {
        if email.isEmpty == false && password.isEmpty == false {
            self.logUSerIn()
        } else {
            self.viewController.standardAlertView(title: "Fille in fields", message: "Please fill in all fields")
        }
        
    }
    
}



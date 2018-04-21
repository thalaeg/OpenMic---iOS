//
//  PasswordResetProtocol.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/21/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit
import Firebase

protocol PasswordResetDelegate {
    var email: String {get}
    var viewController: UIViewController {get}
}

extension PasswordResetDelegate {
    func sendResetPassword() {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let error = error {
                self.viewController.standardAlertView(title: "Error", message: error.localizedDescription)
            } else {
                self.viewController.standardAlertView(title: "Check Email", message: "Check your email for further instructions")
            }
        }
    }
    
}



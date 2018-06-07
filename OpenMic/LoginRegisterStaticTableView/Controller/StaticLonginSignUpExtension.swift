//
//  StaticLonginSignUpExtension.swift
//  OpenMic
//
//  Created by Michael Metzger  on 6/7/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit


//MARK: signup functions
//CreateUserDelegate
extension StaticLoginControllerTableView: CheckSignUpFieldsDelegate, CreateUserDelegate, LogUserInDelegate {
    var password: String {
         return passwordTextFieldOutlet.text!
    }

    var name: String {
        return nameTextFieldOutlet.text!
    }
   
    
    var email: String {
       return emailTexFieldOutlet.text!
    }
    
    var passwordOne: String {
       return passwordTextFieldOutlet.text!
    }
    
 
    var viewController: UIViewController {
        return self
    }
  
    
}

//MARK: Listen for change in authentication state

extension StaticLoginControllerTableView: CheckUserStatusDataSource {
    func userStateChange(loggedIn: Bool) {
        print("user logged in = \(loggedIn)")
    }
    
    
    
    
}



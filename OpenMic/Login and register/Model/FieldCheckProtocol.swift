//
//  FieldCheckProtocol.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/16/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit


protocol CheckSignUpFieldsDelegate {
    var firstName: String {get}
    var LastName: String{get}
    var Gender: String {get}
    var email: String {get}
    var passwordOne: String {get}
    var passwordTwo: String {get}
    var viewController: UIViewController {get}
  
}

extension CheckSignUpFieldsDelegate {
    
    func checkforBlankFields() -> Bool {
        switch (firstName.isEmpty, LastName.isEmpty, Gender.isEmpty, email.isEmpty) {
        case (false, false, false, false):
            //check for blank passwords
            if (self.checkMatchingPasswords()) {
                return true
            } else {
                return false
            }
        default:
            viewController.standardAlertView(title: "Fill in Fields", message: "Please fill in all fields")
            return false
        }
        
    }
    
    private func checkMatchingPasswords() -> Bool {
        switch (passwordOne == passwordTwo, passwordTwo.count > 0, passwordOne.count > 0) {
        case (true, true, true):
            return true
        default:
            viewController.standardAlertView(title: "Passwords mismatch", message: "Make sure your passwords match")
            return false
        }
    }
    //MARK: waiting for completion of gender field
    func newUserFieldsDictionary() -> [String : String] {
        let newUserDic = [ProfileKeys.firstName.rawValue : firstName,
                          ProfileKeys.lastName.rawValue : LastName,
                          ProfileKeys.email.rawValue : email, ProfileKeys.gender.rawValue : Gender]
        return newUserDic
    }
    
    
}




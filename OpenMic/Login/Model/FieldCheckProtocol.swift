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
    var passwordOne: String {get}
    var passwordTwo: String {get}
    
    var viewController: UIViewController {get}
  
}

extension CheckSignUpFieldsDelegate {
    
    func checkforBlankFields() {
        switch (firstName.isEmpty, LastName.isEmpty, Gender.isEmpty) {
        case (false, false, false):
            print("check passwords")
            // check passwords
        default:
            print("fill in all fields")
        }
        
    }
    
    private func checkMatchingPasswords() {
        switch (passwordOne == passwordTwo) {
        case true:
            print("create user ")
        case false:
            print("let them know passwords don't match")
        }
    }
    
}


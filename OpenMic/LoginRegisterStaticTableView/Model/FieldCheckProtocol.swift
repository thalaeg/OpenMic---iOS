//
//  FieldCheckProtocol.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/16/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit


protocol CheckSignUpFieldsDelegate {
    var name: String {get}
    var currentGender: String {get}
    var email: String {get}
    var passwordOne: String {get}
    var dOB: Date {get}
    var viewController: UIViewController {get}
  
}

extension CheckSignUpFieldsDelegate {
    
    
    private func isNotToday() -> Bool {
        
        switch dOB {
        case Date.init():
            return true
        default:
            return false
        }
        
        
    }
    
    func checkforBlankFields() -> Bool {
        switch (name.isEmpty, currentGender.isEmpty, email.isEmpty, isNotToday()) {
        case (false, false, false, false):
            return true
        default:
            viewController.standardAlertView(title: "Fill in Fields", message: "Please fill in all fields")
            return false
        }
        
    }
    
    //MARK: waiting for completion of gender field
    //Temporary user name field 
    func newUserFieldsDictionary() -> [String : String] {
        
        
        let newUserDic = [ProfileKeys.name.rawValue : name,
                          ProfileKeys.email.rawValue : email, ProfileKeys.gender.rawValue : currentGender, ProfileKeys.DOB.rawValue : dOB.formatForDataBase()]
        return newUserDic
    }
    
    
}




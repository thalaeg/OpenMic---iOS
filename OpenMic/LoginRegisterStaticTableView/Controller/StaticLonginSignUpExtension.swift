//
//  StaticLonginSignUpExtension.swift
//  OpenMic
//
//  Created by Michael Metzger  on 6/7/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit


//MARK: signup functions

extension StaticLoginControllerTableView: CheckSignUpFieldsDelegate {

  



    
   
    
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

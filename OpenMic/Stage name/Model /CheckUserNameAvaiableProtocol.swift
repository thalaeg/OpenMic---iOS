//
//  CheckUserNameAvaiableProtocol.swift
//  OpenMic
//
//  Created by Michael Metzger  on 6/30/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit
import SwiftyJSON

protocol CheckUserNameAvailableDelegate {
    var userName: String {get}
    var viewController: UIViewController {get}
    
    func checkUserNameStatus(isAvailable: Bool)
    
}


extension CheckUserNameAvailableDelegate {
    
    func checkUserNameAvailable() {
        //check if user name taken
        Endpoints.checkIfUserNameAvailable.getCallwithParameters(parameters: ["username" : userName]) { (error, json) in
            if let jsonReturn = json {
                let formattedJson = JSON(jsonReturn)
                let isFreeCheck = formattedJson["detail"].boolValue
                if !isFreeCheck {
                    self.viewController.standardAlertView(title: "Not Available", message: "That username is already taken")
                } else {
                    self.checkUserNameStatus(isAvailable: isFreeCheck)
                }
                
                
                
            }
            
        }
    }
   
    
}



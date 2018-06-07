//
//  ApiReadWrite.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/18/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import Foundation
import Alamofire
import Firebase


enum ProfileKeys: String {
    case name
    case username
    case firbaseUid = "firebase_uid"
    case firstName = "first_name"
    case lastName = "last_name"
    case email
    case genre
    case gender
    case DOB 
    //case gender
    case searchRadius = "search_radius"
    case isPrivate
    case profilePic = "Profile_pic"
    case biography
}

enum Endpoints: String {
    case baseURL =  "http://theopenmicapp.pythonanywhere.com/"
    case profiles = "profiles/"
    
    
    
//    func getCall() {
//        Alamofire.request(Endpoints.baseURL.rawValue + self.rawValue + , method: .get, parameters: <#T##Parameters?#>, encoding: <#T##ParameterEncoding#>, headers: <#T##HTTPHeaders?#>)
//
//    }
    
    
    func postCall(with params: [String : Any]) {
        
        var paramInput = params
        guard let uid = Auth.auth().currentUser?.uid else {return}
        paramInput.updateValue(uid, forKey: ProfileKeys.firbaseUid.rawValue)
        
        Alamofire.request(Endpoints.baseURL.rawValue + self.rawValue, method: .post, parameters: paramInput).responseJSON { (response) in
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            if let error = response.error {
                print("error: \(error.localizedDescription)")
            }
            

        }
        
    }
    
}







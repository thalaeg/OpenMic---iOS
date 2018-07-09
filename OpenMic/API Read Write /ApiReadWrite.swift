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
    case addProfile = "profile/profiles"
    case topForty = "profile/top"
    case checkIfUserNameAvailable = "profile/exists"
    
    //MARK: remove redundent api call   
    func getCallwithParameters(parameters: [String : Any]?,  completion: @escaping (_ error: Error?, _ responseJson: Any? ) -> Void) {
        
        Alamofire.request(Endpoints.baseURL.rawValue + self.rawValue, method: .get, parameters: parameters ?? nil).responseJSON { (response) in
            
            if let json = response.result.value {
                completion(nil, json)
            }
            if let error = response.error {
                completion(error, nil)
            }
            
        }
        
    }
    
    
    func getCall(completion: @escaping (_ error: Error?, _ responseJson: Any? ) -> Void) {
        Alamofire.request(Endpoints.baseURL.rawValue + self.rawValue, method: .get).responseJSON { (response) in
            
            if let json = response.result.value {
                completion(nil, json)
            }
            if let error = response.error {
                completion(error, nil)
            }

        }

    }
    
    
    func postCall(with params: [String : Any]) {
        
        var paramInput = params
        guard let uid = Auth.auth().currentUser?.uid else {return}
        paramInput.updateValue(uid, forKey: ProfileKeys.firbaseUid.rawValue)
        print("url \(Endpoints.baseURL.rawValue + self.rawValue), params \(params)")
        
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







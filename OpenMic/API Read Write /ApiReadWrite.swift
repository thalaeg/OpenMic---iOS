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
    case dob
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
    case updateProfile = "profile/profiles/"
    case topForty = "profile/top"
    case checkIfUserNameAvailable = "profile/exists"
    case addArtist = "profile/update-followers/"
    
    //MARK: remove redundent api call
    
    
    
    
    func getCallwithParameters(parameters: [String : Any]?,  completion: @escaping (_ error: Error?, _ responseJson: Any? ) -> Void) {
        
        Alamofire.request(Endpoints.baseURL.rawValue + self.rawValue, method: .get, parameters: parameters ?? nil).responseJSON { (response) in
            
            if let json = response.result.value {
                print("json \(json)")
                completion(nil, json)
            }
            if let error = response.error {
                print("error \(error)")
                completion(error, nil)
            }
            
        }
        
    }
    
    func getCallWithAppenedURL(stringToAppend: String, completion: @escaping (_ error: Error?, _ responseJson: Any? ) -> Void ) {
        Alamofire.request(Endpoints.baseURL.rawValue + self.rawValue + "/\(stringToAppend)/", method: .get).responseJSON { (response) in

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
    
    
    
    func deleteWithEncoding(with BodyEncoding: [String : Any], completionHandler: @escaping (_ jsonResponse: Any?, _ error: Error?) -> Void) {
        
        Alamofire.request(Endpoints.baseURL.rawValue + self.rawValue, method: .delete, parameters: BodyEncoding, encoding: URLEncoding.httpBody).responseJSON { (response) in
            
            if let json = response.result.value {
                completionHandler(json, nil)
            }
            if let error = response.error {
                completionHandler(nil, error)
            }
            
            
        }
        
        
        
    }
    
    
    
    
    func postWithEncoding(with BodyEncoding: [String : Any], completionHandler: @escaping (_ jsonResponse: Any?, _ error: Error?) -> Void) {
        
        Alamofire.request(Endpoints.baseURL.rawValue + self.rawValue, method: .post, parameters: BodyEncoding, encoding: URLEncoding.httpBody).responseJSON { (response) in
            
            if let json = response.result.value {
                completionHandler(json, nil)
            }
            if let error = response.error {
                completionHandler(nil, error)
            }
            
            
        }
        
        
    
    }
    
    
    func postCall(with params: [String : Any], completionHandler: @escaping (_ jsonResponse: Any?, _ error: Error?) -> Void) {
        
        var paramInput = params
        guard let uid = Auth.auth().currentUser?.uid else {return}
        paramInput.updateValue(uid, forKey: ProfileKeys.firbaseUid.rawValue)
        
        Alamofire.request(Endpoints.baseURL.rawValue + self.rawValue, method: .post, parameters: paramInput).responseJSON { (response) in
            
            if let json = response.result.value {
                completionHandler(json, nil)
            }
            if let error = response.error {
                completionHandler(nil, error)
            }
            

        }
        
        
        
        
    }
    
    
    func patchUser(with params: [String : Any], currentUSer: CurrentUser, completionHandler: @escaping (_ jsonResponse: Any?, _ error: Error?) -> Void) {
        //add firebase token
        let currentUser = Auth.auth().currentUser
        currentUser?.getIDTokenForcingRefresh(true) { idToken, error in
            if let _ = error {return}
            
            guard let token = idToken else {return}
            //, headers: ["Authorization" : token]
            Alamofire.request(Endpoints.baseURL.rawValue + self.rawValue + currentUSer.userName, method: .patch, parameters: params, encoding: URLEncoding.httpBody, headers: ["id-token" : token]).responseJSON { (response) in
                if let json = response.result.value {
                    completionHandler(json, nil)
                }
                if let error = response.error {
                    completionHandler(nil, error)
                }
            }

        }
    }
    
}







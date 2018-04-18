//
//  ApiReadWrite.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/18/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import Foundation
import Alamofire


enum ProfileKeys: String {
    case username
    case firbaseUid = "firebase_uid"
    case firstName = "first_name"
    case lastName = "last_name"
    case email
    case genre
    case searchRadius = "search_radius"
    case isPrivate
    case profilePic = "Profile_pic"
    case biography
}

enum Endpoints: String {
    case baseURL =  "http://theopenmicapp.pythonanywhere.com/"
    case profiles = "profiles/"
    
    func postCall(with params: [String : Any]) {
        Alamofire.request(Endpoints.baseURL.rawValue + self.rawValue, method: .post, parameters: params).responseJSON { (response) in
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            if let error = response.error {
                print("error: \(error.localizedDescription)")
            }
            

        }
        
    }
    
}







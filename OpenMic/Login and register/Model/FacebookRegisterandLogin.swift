//
//  FacebookRegisterandLogin.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/27/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import Firebase
import SwiftyJSON

class ManageFacebook: NSObject {
    
    
    var managedVC: UIViewController

    
    init(viewController: UIViewController) {
        self.managedVC = viewController
        super.init()
        FBSDKLoginManager().logOut()
    }
    
    
    
    func loginWithCustomButton() {
        let fbLoginManager = FBSDKLoginManager()
        //"id, name, first_name, last_name
        
        fbLoginManager.logIn(withReadPermissions: ["email"], from: managedVC) { (result, error) in
            print("error \(error.debugDescription)")
            guard let userCanceld = result?.isCancelled else {return}
            if !userCanceld {
                if error == nil {
                    let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                    self.authThenticateWithFBToken(authCredential: credential)
                } else {
                    self.managedVC.standardAlertView(title: "error", message: error!.localizedDescription)
                }
            }
        }
    }
    
    
    private func authThenticateWithFBToken(authCredential: AuthCredential) {
        Auth.auth().signIn(with: authCredential) { (user, error) in
            if let errorCheck = error {
                self.managedVC.standardAlertView(title: "Error", message: errorCheck.localizedDescription)
                return
            } else {
                if let userID = user?.uid {
                    self.checkToCreateUser(userID: userID)
                }
            }
            
        }
        
    }
    
    
    

    
    
    
    
    
    private func checkToCreateUser(userID: String) {
        
        BasePaths.users.getNonUIDBase().observeSingleEvent(of: .value, with: { snapShot in
           
            if snapShot.hasChild(userID){
                print("user already created")
            } else {
                BasePaths.users.getNonUIDBase().child(userID).setValue([BasePaths.uid.rawValue : userID])
                self.appendGraphValues(withUid: userID)
            }
        })
        
    }
    
    private func appendGraphValues(withUid: String) {
        FBSDKGraphRequest(graphPath: "me", parameters:  ["fields": "id, name, first_name, last_name, email"]).start { (connection, result, error) in
            if error == nil {
                guard let resultCheck = result else {return}
                let json = JSON(resultCheck)
                let email = json["email"].stringValue
                let firstName = json["first_name"].stringValue
                let lastName = json["last_name"].stringValue
                let newUserDic = [ProfileKeys.firstName.rawValue : firstName,
                                  ProfileKeys.lastName.rawValue : lastName,
                                  ProfileKeys.email.rawValue : email]
                
                BasePaths.users.getNonUIDBase().child(withUid).child(BasePaths.userDetails.rawValue).setValue(newUserDic)
            }
        }
    }
    
    
    
    
}

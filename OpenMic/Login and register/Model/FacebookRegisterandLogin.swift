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

class ManageFacebook: NSObject, FBSDKLoginButtonDelegate {
    
    
    var managedVC: UIViewController
    var faceBookButton: FBSDKLoginButton
    
    init(viewController: UIViewController, facebookButton: FBSDKLoginButton ) {
        self.managedVC = viewController
        self.faceBookButton = facebookButton
        super.init()
        self.faceBookButton.delegate = self
        FBSDKLoginManager().logOut()
        self.faceBookButton.readPermissions = ["public_profile", "email"]
        
    }
    
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if let error = error {
            print(error.localizedDescription)
        } else if !result.isCancelled {
            let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
            
            Auth.auth().signIn(with: credential) { (user, error) in
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
        
        
        
        
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        // handle logging out
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

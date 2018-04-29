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

class ManageFacebook: NSObject, FBSDKLoginButtonDelegate {
    
    
    var managedVC: UIViewController
    var faceBookButton: FBSDKLoginButton
    
    init(viewController: UIViewController, facebookButton: FBSDKLoginButton ) {
        self.managedVC = viewController
        self.faceBookButton = facebookButton
        super.init()
        self.faceBookButton.delegate = self
        self.faceBookButton.readPermissions = ["public_profile", "email"]
        
    }
    
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("result \(result)")
        if let error = error {
            print(error.localizedDescription)
        } else if !result.isCancelled {
            let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
            FBSDKGraphRequest(graphPath: "me", parameters:  ["fields": "id, name, first_name, last_name, email"]).start { (connection, result, error) in
                if error == nil {
                    print("graph result \(result)")
                }
            }
            Auth.auth().signIn(with: credential) { (user, error) in
                if let errorCheck = error {
                    
                    print("localized description \(errorCheck.localizedDescription), non descrip \(errorCheck)")
                    // ...
                    return
                }
                // User is signed in
                // ...
            }
        }
        
        
        
        
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        // handle logging out
    }
    
    
    
    
    
}

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
    
    
    var loginButton: FBSDKLoginButton
    var managedVC: UIViewController
    
    init(viewController: UIViewController, loginButton: FBSDKLoginButton) {
        self.managedVC = viewController
        self.loginButton = loginButton
        super.init()
        self.loginButton.delegate = self
    }
    
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
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
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        // handle logging out
    }
    
    
    
    
    
}

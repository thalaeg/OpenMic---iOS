//
//  LoginViewController.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/18/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: BaseViewController {
    

    @IBOutlet var emailTextField: UitextFieldWithWhitePlaceHolder!
    
    @IBOutlet var passwordOutlet: UitextFieldWithWhitePlaceHolder!
    
    private var authenticateDelegate: LogUserInDelegate?
    var facebookManager: ManageFacebook?
    
    @IBAction func emailAction(_ sender: Any) {
        passwordOutlet.becomeFirstResponder()
    }
    
    @IBAction func passwordAction(_ sender: Any) {
        authenticateDelegate?.checkFieldsAndAuthenticate()
        
    }
    
    
    @IBAction func signInAction(_ sender: Any) {
        authenticateDelegate?.checkFieldsAndAuthenticate()
    }
    
    
    @IBOutlet var loginWithFacebookButton: FBSDKLoginButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        facebookManager = ManageFacebook(viewController: self, facebookButton: loginWithFacebookButton)
        authenticateDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
 

}

extension LoginViewController: LogUserInDelegate {
  
    var email: String {
        return emailTextField.text!
    }
    
    var password: String {
        return passwordOutlet.text!
    }
    
    var viewController: UIViewController {
        return self
    }
    
    
    
}

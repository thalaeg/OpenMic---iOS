//
//  LoginViewController.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/18/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet var emailTextField: UitextFieldWithWhitePlaceHolder!
    
    @IBOutlet var passwordOutlet: UitextFieldWithWhitePlaceHolder!
    
    @IBAction func emailAction(_ sender: Any) {
        passwordOutlet.becomeFirstResponder()
    }
    
    @IBAction func passwordAction(_ sender: Any) {
        print("login")
        
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

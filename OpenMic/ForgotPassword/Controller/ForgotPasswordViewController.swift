//
//  ForgotPasswordViewController.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/21/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    var passwordDelegate: PasswordResetDelegate?
    var sendEmailDelegate: SendHelpEmail?
    
    @IBOutlet var emailTestFieldOutlet: UitextFieldWithWhitePlaceHolder!
    
    @IBAction func getNewPassword(_ sender: Any) {
        passwordDelegate?.sendResetPassword()
        
    }
    
    @IBAction func sendReset(_ sender: Any) {
         passwordDelegate?.sendResetPassword()
        emailTestFieldOutlet.resignFirstResponder()
    }
    
   
    @IBAction func needMoreHelp(_ sender: Any) {
        
        sendEmailDelegate = SendHelpEmail(viewController: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordDelegate = self
    }


}


extension ForgotPasswordViewController: PasswordResetDelegate {
    var email: String {
        return emailTestFieldOutlet.text!
    }
    
    var viewController: UIViewController {
        return self
    }
    
    
}

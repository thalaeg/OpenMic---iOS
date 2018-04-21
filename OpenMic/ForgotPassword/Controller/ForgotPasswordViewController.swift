//
//  ForgotPasswordViewController.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/21/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: BaseViewController {
    var passwordDelegate: PasswordResetDelegate?
    
    @IBOutlet var emailTestFieldOutlet: UitextFieldWithWhitePlaceHolder!
    
    @IBAction func getNewPassword(_ sender: Any) {
        passwordDelegate?.sendResetPassword()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordDelegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

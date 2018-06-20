//
//  LoginSelectViewController.swift
//  OpenMic
//
//  Created by Michael Metzger  on 5/30/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

@IBDesignable
class LoginSelectViewController: BaseViewHiddenNav {

    
    private var isSignUp = false
    private var loginSegue = "login"
    
    @IBOutlet var loginButtonOutlet: UIButton!
    
    @IBAction func signupAction(_ sender: Any) {
        isSignUp = true
        self.performSegue(withIdentifier: loginSegue, sender: self)
        
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
        isSignUp = false
        self.performSegue(withIdentifier: loginSegue, sender: self)
        
    }
    
    
 
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loginButtonOutlet.backgroundColor = .clear
        loginButtonOutlet.layer.borderWidth = 0.5
        loginButtonOutlet.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        

        addBackgroundImage(assetName: "backgroundLoginSelect.png")
        
    }
    

    
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        addBackgroundImage(assetName: "backgroundLoginSelect.png")
    }
    


}


extension LoginSelectViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == loginSegue {
           guard let vc = segue.destination as? StaticLoginControllerTableView else {return}
            vc.isSignup = isSignUp
        }
    }
}

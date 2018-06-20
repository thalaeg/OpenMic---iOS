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
    
    @IBAction func signupAction(_ sender: Any) {
        isSignUp = true
        self.performSegue(withIdentifier: loginSegue, sender: self)
        
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
        isSignUp = false
        self.performSegue(withIdentifier: loginSegue, sender: self)
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
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

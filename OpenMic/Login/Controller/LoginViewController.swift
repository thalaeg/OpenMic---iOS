//
//  LoginViewController.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/16/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    private var checkFieldsDelegate: CheckSignUpFieldsDelegate?
    private var createNewUserDelegate: CreateUserDelegate?
    
    @IBOutlet var firstNameTextField: UITextField!
    
    @IBOutlet var lastNameTextField: UITextField!
    
    @IBOutlet var gendChoiceStackView: UIStackView!
    private var genderChoice: String = "Male"
    
    @IBOutlet var maleSwitch: UISwitch!
    @IBOutlet var femailSwitch: UISwitch!
    @IBAction func genderButton(_ sender: Any) {
        switch gendChoiceStackView.isHidden {
        case true:
            gendChoiceStackView.isHidden = false
        case false:
            gendChoiceStackView.isHidden = true
        }
    }
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passworTextField: UITextField!
    
    @IBOutlet var verifyPasswordTextField: UITextField!
    
    
    @IBAction func registerAction(_ sender: Any) {
        if let allfieldsFilled = checkFieldsDelegate?.checkforBlankFields() {
            if (allfieldsFilled) {
                createNewUserDelegate?.createNewuser(email: email, password: passwordOne, completion: { (error) in
                    if (!error) {
                        //add new user to api
                        guard let checkFieldDelegate = self.checkFieldsDelegate else {return}
                        Endpoints.profiles.postCall(with: checkFieldDelegate.newUserFieldsDictionary())
                    }
                })
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkFieldsDelegate = self
        createNewUserDelegate = self

    }

    
}


//MARK: Check fields delegate method
extension LoginViewController: CheckSignUpFieldsDelegate, CreateUserDelegate {
    
    var email: String {
        return emailTextField.text!
    }
    
    var firstName: String {
        return firstNameTextField.text!
    }
    
    var LastName: String {
        return lastNameTextField.text!
    }
    
    var Gender: String {
        return genderChoice
    }
    
    var passwordOne: String {
        return passworTextField.text!
    }
    
    var passwordTwo: String {
        return verifyPasswordTextField.text!
    }
    
    var viewController: UIViewController {
        return self
    }
    
    
    
}
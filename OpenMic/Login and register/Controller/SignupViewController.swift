//
//  LoginViewController.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/16/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit
import FBSDKLoginKit


class SignupViewController: BaseViewController {
    private var checkFieldsDelegate: CheckSignUpFieldsDelegate?
    private var createNewUserDelegate: CreateUserDelegate?
    private var manageFaceBookAuth: ManageFacebook?
    
    @IBOutlet var facebookButton: FBSDKLoginButton!
    
    @IBOutlet var firstNameTextField: UITextField!
    
    @IBOutlet var lastNameTextField: UITextField!
    
    
    @IBOutlet var genderChoiceTextField: UitextFieldWithWhitePlaceHolder!
    
    
    @IBOutlet var emailTextField: UitextFieldWithWhitePlaceHolder!
    @IBOutlet var passworTextField: UITextField!
    
    @IBOutlet var verifyPasswordTextField: UITextField!
    
    
    @IBAction func FirstNameResign(_ sender: Any) {
        lastNameTextField.becomeFirstResponder()
    }
    
    
    @IBAction func lastnameResign(_ sender: Any) {
        genderChoiceTextField.becomeFirstResponder()
    }
    
    
    @IBAction func generResign(_ sender: Any) {
        emailTextField.becomeFirstResponder()
    }
    
    
    
    @IBAction func emailResign(_ sender: Any) {
        passworTextField.becomeFirstResponder()
    }
    
    @IBAction func passwordOneResign(_ sender: Any) {
        verifyPasswordTextField.becomeFirstResponder()
    }
    
    
    @IBAction func passwordTwoRegister(_ sender: Any) {
       registerNewUser()
    }
    
    @IBAction func registerAction(_ sender: Any) {
        registerNewUser()
        
//        if let allfieldsFilled = checkFieldsDelegate?.checkforBlankFields() {
//            if (allfieldsFilled) {
//                self.performSegue(withIdentifier: "userType", sender: self)
////                createNewUserDelegate?.createNewuser(email: email, password: passwordOne, completion: { (error, user) in
////                    if (!error) {
////                        //add new user to api
////                        guard let checkFieldDelegate = self.checkFieldsDelegate, let uid = user?.uid else {return}
////                        //pass fields to next view
////                        var dicWithFakeUserName = checkFieldDelegate.newUserFieldsDictionary()
////                        //MikeTest
////                        //MARK: update fake placeholder name
////                        dicWithFakeUserName.updateValue("MikeTest2", forKey: ProfileKeys.username.rawValue)
////                        dicWithFakeUserName.updateValue(uid, forKey: ProfileKeys.firbaseUid.rawValue)
////
////                        Endpoints.profiles.postCall(with: dicWithFakeUserName)
////                    }
////                })
//            }
//        }
        
    }
    
    
    private func registerNewUser() {
        if let allfieldsFilled = checkFieldsDelegate?.checkforBlankFields(), let newUserFieldsDic = checkFieldsDelegate?.newUserFieldsDictionary() {
            if allfieldsFilled {
                createNewUserDelegate?.createNewuser(email: email, password: passwordOne, additonalFields: newUserFieldsDic, completion: { (error, newUser) in
                    if !error {
                        self.performSegue(withIdentifier: "userType", sender: self)
                    }
                })
            }
    
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manageFaceBookAuth = ManageFacebook(viewController: self, facebookButton: facebookButton)
        
        checkFieldsDelegate = self
        createNewUserDelegate = self

    }

    
}


//MARK: Check fields delegate method
extension SignupViewController: CheckSignUpFieldsDelegate, CreateUserDelegate {
    
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
        return genderChoiceTextField.text!
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








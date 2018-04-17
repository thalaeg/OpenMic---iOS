//
//  LoginViewController.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/16/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var firstNameTextField: UITextField!
    
    @IBOutlet var lastNameTextField: UITextField!
    
    @IBOutlet var gendChoiceStackView: UIStackView!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
}

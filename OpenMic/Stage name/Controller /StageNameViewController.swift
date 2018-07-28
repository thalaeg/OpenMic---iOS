//
//  StageNameViewController.swift
//  OpenMic
//
//  Created by Michael Metzger  on 6/8/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit
class StageNameViewController: UIViewController {
    
    private var barButtonItemOne: UIBarButtonItem?
    //private var barButtonItemTwo: UIBarButtonItem?
    
    
    @IBOutlet var usernameTextFieldOutlet: UITextField!
    @IBOutlet var fieldContainerView: UIView!
    
    private var checkUSerNameFreeDelegate: CheckUserNameAvailableDelegate?
    private var createUserApiDelegate: CreateNewUSerAPIDelegate?
    
    @IBAction func userNameTextChanged(_ sender: UITextField) {
        if usernameTextFieldOutlet.text!.count > 2 {
            addRightBarbuttonItem(fadded: false)
        }
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkUSerNameFreeDelegate = self
        createUserApiDelegate = self
       
    }
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        customizeButtons()
    }
    

}

@IBDesignable extension StageNameViewController {
    private func customizeButtons() {
        //right button
        createTwoRightBarButtons()
   
        
        //left button
        let skipFornow = UIButton()
        skipFornow.frame = CGRect(x: 0, y: 0, width: 100, height: 21)
        skipFornow.setTitle("Skip for now", for: .normal)
        
    
        skipFornow.setTitleColor(#colorLiteral(red: 0.7647058824, green: 0, blue: 0.003921568627, alpha: 1), for: .normal)
        skipFornow.tintColor = #colorLiteral(red: 0.7647058824, green: 0, blue: 0.003921568627, alpha: 1)

        skipFornow.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        let leftbarButtonItem = UIBarButtonItem(customView: skipFornow)
        self.navigationItem.leftBarButtonItem = leftbarButtonItem
        
        //set textfield border
        
        usernameTextFieldOutlet.layer.borderColor = #colorLiteral(red: 0.7647058824, green: 0, blue: 0.003921568627, alpha: 1)
        usernameTextFieldOutlet.layer.borderWidth = 1.0
        usernameTextFieldOutlet.layer.cornerRadius = 5
        
        //container view border
        
        fieldContainerView.layer.borderWidth = 1.0
        fieldContainerView.layer.borderColor = #colorLiteral(red: 0.8078431373, green: 0.8078431373, blue: 0.8078431373, alpha: 1)

    }
    
    @objc private func checkName() {
        //check if user name taken
        checkUSerNameFreeDelegate?.checkUserNameAvailable()
       // self.performSegue(withIdentifier: "topForty", sender: self)
    }
    
}


extension StageNameViewController: CheckUserNameAvailableDelegate, CreateNewUSerAPIDelegate {
    var viewController: UIViewController {
        return self
    }
    
    var userName: String {
       return usernameTextFieldOutlet.text!
    }
    
    func checkUserNameStatus(isAvailable: Bool){
        
        if isAvailable {
            createUserApiDelegate?.createNewUserOnApi(completion: { (success) in
                switch success {
                case true:
                    self.performSegue(withIdentifier: "topForty", sender: self)
                case false:
                    //MARK: replace this alert when api calls are complete
                    self.standardAlertView(title: "Error", message: "There was an api error")
                }
                
            })
        }
        
        
        
    }
    
    
}


extension StageNameViewController {
    
    
    private func createTwoRightBarButtons() {
        let nextButton = UIButton()
        nextButton.frame = CGRect(x: 0, y: 0, width: 50, height: 21)
        nextButton.setTitle("Next", for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        nextButton.addTarget(self, action: #selector(checkName), for: .touchUpInside)
        nextButton.backgroundColor = #colorLiteral(red: 0.7647058824, green: 0, blue: 0.003921568627, alpha: 1)
        
        nextButton.layer.cornerRadius = 15
        
        barButtonItemOne = UIBarButtonItem(customView: nextButton)
        self.navigationItem.rightBarButtonItem = barButtonItemOne
         self.navigationItem.rightBarButtonItem?.isEnabled = true
        barButtonItemOne!.tintColor = UIColor.blue
        
      
    }
    
   private func addRightBarbuttonItem(fadded: Bool) {
    
    switch fadded {
    case true:
        barButtonItemOne!.tintColor = UIColor.blue
       // self.navigationItem.rightBarButtonItem?.isEnabled = false
       //self.navigationItem.setRightBarButtonItems([barButtonItemOne!], animated: false)
    case false :
        barButtonItemOne!.tintColor = UIColor.purple
        //self.navigationItem.rightBarButtonItem?.isEnabled = true
//        self.navigationItem.rightBarButtonItems = [self.barButtonItemTwo!]
    }

    
    }
    
}




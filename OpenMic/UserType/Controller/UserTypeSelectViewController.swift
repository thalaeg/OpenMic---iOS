//
//  UserTypeSelectViewController.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/20/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class UserTypeSelectViewController: BaseViewwithChair {
    
    
    
    @IBOutlet var userNameTextField: UitextFieldWithWhitePlaceHolder!
    
    
    
    @IBAction func userNameNext(_ sender: Any) {
        userNameTextField.resignFirstResponder()
    }
    
    @IBAction func ArtistGenre(_ sender: Any) {
        
    }
    @IBAction func artistSelect(_ sender: Any) {
        print("artist Select")
    }
    
    @IBAction func fanSelect(_ sender: Any) {
        print("Fan Select")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
    

}

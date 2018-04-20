//
//  UserTypeSelectViewController.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/20/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class UserTypeSelectViewController: BaseViewwithChair {
    
    private var userTypeSelect: String?
    
    @IBOutlet var userNameTextField: UitextFieldWithWhitePlaceHolder!
    
    
    @IBOutlet var artistDot: UIImageView!
    
    @IBOutlet var fanDot: UIImageView!
    
    @IBAction func userNameNext(_ sender: Any) {
        userNameTextField.resignFirstResponder()
    }
    
    @IBAction func ArtistGenre(_ sender: Any) {
        
    }
    @IBAction func artistSelect(_ sender: Any) {
        artistDot.isHidden = false
        fanDot.isHidden = true
    }
    
    @IBAction func fanSelect(_ sender: Any) {
        artistDot.isHidden = true
        fanDot.isHidden = false

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        artistDot.isHidden = true
        fanDot.isHidden = true

    }

   
    

}

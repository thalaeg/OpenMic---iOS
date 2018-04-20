//
//  UserTypeSelectViewController.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/20/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class UserTypeSelectViewController: BaseViewwithChair {
    private var pickerSelect: PickerSelect!
    private var userTypeSelect: String?
    
    @IBOutlet var userNameTextField: UitextFieldWithWhitePlaceHolder!
    
    @IBOutlet var pickerViewOutlet: UIPickerView!
    
    @IBOutlet var artistDot: UIImageView!
    
    @IBOutlet var fanDot: UIImageView!
    
    @IBAction func userNameNext(_ sender: Any) {
        userNameTextField.resignFirstResponder()
    }
    
    @IBAction func ArtistGenre(_ sender: Any) {
        switch pickerViewOutlet.isHidden {
        case true:
            pickerViewOutlet.isHidden = false
        case false:
            pickerViewOutlet.isHidden = true
        }
    }
    @IBAction func artistSelect(_ sender: Any) {
        artistDot.isHidden = false
        fanDot.isHidden = true
        userTypeSelect = "Artist"
    }
    
    @IBAction func fanSelect(_ sender: Any) {
        userTypeSelect = "Fan"
        artistDot.isHidden = true
        fanDot.isHidden = false

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerSelect = PickerSelect(picker: pickerViewOutlet)
        pickerViewOutlet.delegate = pickerSelect
        pickerViewOutlet.dataSource = pickerSelect
        artistDot.isHidden = true
        fanDot.isHidden = true

    }

   
    

}

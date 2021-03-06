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
    @IBOutlet var nextStack: UIStackView!
    
    @IBOutlet var artistView: ViewWithBottomLayer!
    @IBOutlet var userNameTextField: UitextFieldWithWhitePlaceHolder!
    
    @IBOutlet var pickerViewOutlet: UIPickerView!
    
    @IBOutlet var artistDot: UIImageView!
    
    @IBOutlet var fanDot: UIImageView!
    
    @IBAction func userNameNext(_ sender: Any) {
        userNameTextField.resignFirstResponder()
    }
    
    
    @IBAction func nextButton(_ sender: Any) {
        self.performSegue(withIdentifier: "genreSelect", sender: self)
//        if (userNameTextField.text?.isEmpty)! {
//            self.standardAlertView(title: "User Name", message: "Please choose a user name")
////        } else {
//            CurrentUser.getallUserValuesDictionar { (userDictionary) in
//                var dictionaryInput = userDictionary
//                print("dictionary \(dictionaryInput)")
//                dictionaryInput.updateValue(self.userNameTextField.text!, forKey: ProfileKeys.username.rawValue)
//                Endpoints.profiles.postCall(with: dictionaryInput)
//
//            }
//        }
        
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

        hideUnhideViews(isArtist: true)
        userTypeSelect = "Artist"
    }
    
    @IBAction func fanSelect(_ sender: Any) {
        hideUnhideViews(isArtist: false)
        userTypeSelect = "Fan"


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pickerSelect = PickerSelect(picker: pickerViewOutlet)
        pickerViewOutlet.delegate = pickerSelect
        pickerViewOutlet.dataSource = pickerSelect
        pickerSelect.delegate = self
        artistDot.isHidden = true
        fanDot.isHidden = true
    }
    

}

extension UserTypeSelectViewController: PickerSelectDelegate {
    func selectedGenre(genre: Genre) {
        nextStack.isHidden = false
    }
    
    
    private func hideUnhideViews(isArtist: Bool) {
        switch isArtist {
        case true:
            artistDot.isHidden = false
            fanDot.isHidden = true
            nextStack.isHidden = true
            artistView.isHidden = false
        case false:
            artistDot.isHidden = true
            artistView.isHidden = true
            pickerViewOutlet.isHidden = true
            fanDot.isHidden = false
            nextStack.isHidden = false
        }
        
    }
    
    
}






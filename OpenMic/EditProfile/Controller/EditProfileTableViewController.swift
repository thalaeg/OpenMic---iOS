//
//  EditProfileTableViewController.swift
//  OpenMic
//
//  Created by Mike on 8/11/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class EditProfileTableViewController: UITableViewController, UITextViewDelegate {
    internal var currentUser: CurrentUser?
    internal var userFullName: String?
    internal var username: String?
    internal var userBio: String?
    internal var userLocation: String?
    private var saveProfileUpdatesDelegate: SaveProfileUpdatesDelegate?
    private var imagePickerDelegate: ChooseImage?
    
    
    
    @IBOutlet weak var userImage: UIImageView!
    
    
    @IBOutlet weak var fullNameOutlet: UITextField!
    
    @IBOutlet weak var usernameOutlet: UITextField!
    @IBOutlet weak var bioOutlet: UITextView!
    @IBOutlet weak var locationOutlet: UITextField!
    
    @IBAction func changeUserImage(_ sender: Any) {
        self.pickCameraTypeAlert(title: "", message: "") { (cameraType) in
            switch cameraType {
            case .camera:
                self.imagePickerDelegate = ChooseImage(vc: self, source: .camera)
            case .library:
                self.imagePickerDelegate = ChooseImage(vc: self, source: .photoLibrary)
            }
            self.imagePickerDelegate?.updatePhotoDelegate = self
            self.imagePickerDelegate?.presentView()
        }
        
        
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveProfileAcrtion(_ sender: Any) {
        saveProfileUpdatesDelegate?.updateUserParameters()
    }
    
    
    @IBAction func fullNameTextAction(_ sender: UITextField) {
        userFullName = sender.text
    }
    
    @IBAction func usernameChangedAction(_ sender: UITextField) {
        username = sender.text
    }
    
    
    
    @IBAction func locationChangedAction(_ sender: UITextField) {
        userLocation = sender.text
    }
    
  
    
    func textViewDidChange(_ textView: UITextView) {
        userBio = textView.text
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let usercheck = currentUser {
            fullNameOutlet.text = "\(usercheck.firstName) + \(usercheck.lastName)"
            usernameOutlet.text = usercheck.userName
            self.saveProfileUpdatesDelegate = self
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

}



extension EditProfileTableViewController: SaveProfileUpdatesDelegate, UpDatePhotoDelegate {
    func upDatePhoto(image: UIImage) {
        userImage.image = image
    }
    
  
    
    
    
}








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
    
    
    
    
    
    @IBOutlet weak var fullNameOutlet: UITextField!
    
    @IBOutlet weak var usernameOutlet: UITextField!
    @IBOutlet weak var bioOutlet: UITextView!
    @IBOutlet weak var locationOutlet: UITextField!
    
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveProfileAcrtion(_ sender: Any) {
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
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}



extension EditProfileTableViewController: SaveProfileUpdatesDelegate {
  
    
    
    
}








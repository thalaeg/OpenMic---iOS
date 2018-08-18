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
    }
    
    @IBAction func usernameChangedAction(_ sender: UITextField) {
        
    }
    
    
    
    @IBAction func locationChangedAction(_ sender: UITextField) {
    }
    
  
    
    func textViewDidChange(_ textView: UITextView) {
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



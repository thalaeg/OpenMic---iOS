//
//  StaticLoginControllerTableView.swift
//  OpenMic
//
//  Created by Michael Metzger  on 6/1/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class StaticLoginControllerTableView: UITableViewController {
   
    //MARK: static cell outlets
    
    
    var isSignup = false

    @IBOutlet var signupOrSignInbutton: UIButton!
    
    @IBAction func signupOrlSignInAction(_ sender: Any) {
        
        
        
    }
    
   // @IBOutlet var datePickerCell: UITableViewCell!
    
    @IBOutlet var dateOfBirthOutlet: UIDatePicker!
    
    @IBOutlet var genderPickerOutlet: UIPickerView!
    private var genderPickerManager: GenderSelect?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        genderPickerManager = GenderSelect(picker: genderPickerOutlet)
        genderPickerOutlet.dataSource = genderPickerManager
        genderPickerOutlet.delegate = genderPickerManager
        dateOfBirthOutlet.isHidden = true
        genderPickerOutlet.isHidden = true

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        switch indexPath.row {
        case 5:
            genderPickerOutlet.isHidden = !genderPickerOutlet.isHidden
            dateOfBirthOutlet.isHidden = true
            self.tableView.reloadRows(at: [IndexPath(item: 4 , section: 0)], with: .top)
            loadPickerView(atPath: 6)
        case 3:
            dateOfBirthOutlet.isHidden = !dateOfBirthOutlet.isHidden
            genderPickerOutlet.isHidden = true
            self.tableView.reloadRows(at: [IndexPath(item: 6 , section: 0)], with: .top)
            loadPickerView(atPath: 4)
        default:
            return
        }
        

    }
    
    private func loadPickerView(atPath: Int) {
        self.tableView.reloadRows(at: [IndexPath(item: atPath , section: 0)], with: .top)
        tableView.scrollToRow(at: IndexPath(item: atPath, section: 0), at: .none, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      
        
        switch indexPath.row {
        case 0,3,5:
           return setupLogingOrSignup()
        case 6:
            return genderPickerOutlet.isHidden ? 0 : UITableViewAutomaticDimension
            
        case 4:
            return dateOfBirthOutlet.isHidden ? 0 : UITableViewAutomaticDimension
        default:
            return UITableViewAutomaticDimension
        }
        

        
    }

   
}

extension StaticLoginControllerTableView {
 
    private func setupLogingOrSignup() -> CGFloat {
        switch isSignup {
        case true:
            signupOrSignInbutton.setTitle("Sign Up", for: .normal)
            return UITableViewAutomaticDimension
        case false:
            signupOrSignInbutton.setTitle("Sign In", for: .normal)
            return 0
        }
 
    }
    
}







//
//  StaticLoginControllerTableView.swift
//  OpenMic
//
//  Created by Michael Metzger  on 6/1/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class StaticLoginControllerTableView: UITableViewController {
   
    //MARK: static cell outlets for checkboxes
    
    @IBOutlet var nameCellOutlet: UITableViewCell!
    
    
    @IBOutlet var emailCellOutlet: UITableViewCell!
    
    @IBOutlet var passwordCellOutlet: UITableViewCell!
    
    var isSignup = false
    //MARK: signup and signin outlets and actions

    @IBOutlet var singupAndSignInWithFacebookOutlet: UIButton!
    
    @IBAction func facebookAction(_ sender: Any) {
        
    }
    
    @IBOutlet var signupOrSignInbutton: UIButton!
    
    @IBAction func signupOrlSignInAction(_ sender: Any) {
        
        
        
    }
    
    //MARK: DOB and Gender actions
    
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


//MARK: funciton for hiding and showing fields depending on signup or login
extension StaticLoginControllerTableView {
    
    private func setupLogingOrSignup() -> CGFloat {
        switch isSignup {
        case true:
            singupAndSignInWithFacebookOutlet.setTitle("SIGN UP WITH FACEBOOK", for: .normal)
            signupOrSignInbutton.setTitle("Sign Up", for: .normal)
            return UITableViewAutomaticDimension
        case false:
            singupAndSignInWithFacebookOutlet.setTitle("SIGN IN WITH FACEBOOK", for: .normal)
            signupOrSignInbutton.setTitle("Sign In", for: .normal)
            return 0
        }
 
    }
    
}



//MARK: Delegate methods for determining which textfield to show checkMark
extension StaticLoginControllerTableView: UITextFieldDelegate {
    

    func textFieldDidEndEditing(_ textField: UITextField) {
        //switch on textfield for checkmark
        var didFillField = false
        if let isTextCheck = textField.text {
            if isTextCheck.count > 1 {
                didFillField = true
            }
        }

        changeCellIndicator(byTag: textField.tag, didFillField: didFillField)
        
    }
    
    //find the correct cell belonging to the textfield
    private func changeCellIndicator(byTag: Int, didFillField: Bool) {
        switch byTag {
        case 1:
            turnOffandOnCellAccesory(cell: nameCellOutlet, didFillField: didFillField)
        case 2:
            turnOffandOnCellAccesory(cell: emailCellOutlet, didFillField: didFillField)
        case 3:
            turnOffandOnCellAccesory(cell: passwordCellOutlet, didFillField: didFillField)
        default:
            return
        }
        
        
    }
    //turn of or on the cell depending on if they filled out the field
    private func turnOffandOnCellAccesory(cell: UITableViewCell, didFillField: Bool ) {
        switch didFillField {
        case true:
            cell.accessoryType = .checkmark
        case false:
            cell.accessoryType = .none
        }
    }
    
    //for resigning first responder
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//
//    }
    
}







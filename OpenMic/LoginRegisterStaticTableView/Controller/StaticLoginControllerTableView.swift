//
//  StaticLoginControllerTableView.swift
//  OpenMic
//
//  Created by Michael Metzger  on 6/1/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class StaticLoginControllerTableView: UITableViewController {
    var isSignup = false
    private var checkFieldsDelegate: CheckSignUpFieldsDelegate?
    private var createNewUserDelegate: CreateUserDelegate?
    internal var currentGender: String = "Male"
   internal var dOB = Date.init()
 
    //MARK: static cell outlets for checkboxes
    
    @IBOutlet var nameCellOutlet: UITableViewCell!
    
    
    @IBOutlet var emailCellOutlet: UITableViewCell!
    
    @IBOutlet var passwordCellOutlet: UITableViewCell!
    
    //MARK: forgotPassword
    
    @IBOutlet var forgotPasswordOutlet: UIButton!
    
    @IBAction func forgotPasswordAction(_ sender: Any) {
    }
    
    
    
   
    //MARK: signup and signin outlets and actions

    @IBOutlet var singupAndSignInWithFacebookOutlet: UIButton!
    
    @IBAction func facebookAction(_ sender: Any) {
        
    }
    
    @IBOutlet var signupOrSignInbutton: UIButton!
    
    @IBAction func signupOrlSignInAction(_ sender: Any) {
        switch isSignup {
        case true:
            checkFieldsDelegate = self
            createNewUserDelegate = self
            guard let noBlanks = checkFieldsDelegate?.checkforBlankFields(), let fieldCheck = checkFieldsDelegate else {return }
            if noBlanks {
                createNewUserDelegate?.createNewuser(email: email, password: passwordOne, additonalFields: fieldCheck.newUserFieldsDictionary(), completion: { (error, user) in
                    if let userCheck = user {
                        print("segue to next step ")
                    }
                    
                })
            }
        case false:
            print("log userin")
        }
        
       
        
        
    }
    
    //Mark: textFieldOutlets and actions
    @IBOutlet var nameTextFieldOutlet: UITextField!
    
    @IBAction func nameTextFieldNext(_ sender: Any) {
        emailTexFieldOutlet.becomeFirstResponder()
    }
    
    
    @IBOutlet var emailTexFieldOutlet: UITextField!
    
    @IBAction func emailTextFieldNext(_ sender: Any) {
        passwordTextFieldOutlet.becomeFirstResponder()
    }
    
    
    @IBOutlet var passwordTextFieldOutlet: UITextField!
    
    @IBAction func passwordTextFieldNext(_ sender: Any) {
        self.view.endEditing(true)
    
        
    }
    
    @IBAction func showPasswordAction(_ sender: Any) {
        
        passwordTextFieldOutlet.isSecureTextEntry =  !passwordTextFieldOutlet.isSecureTextEntry
        
        
    }
    //MARK: DOB and Gender actions
    @IBOutlet var dobCell: UITableViewCell!
    @IBOutlet var selectedDobLabelOutlet: UILabel!
    @IBOutlet var dateOfBirthOutlet: UIDatePicker!
    @IBAction func DobPickerAction(_ sender: UIDatePicker) {
        turnOffandOnCellAccesory(cell: dobCell, didFillField: true)
        selectedDobLabelOutlet.text = sender.date.formatForUSer()
        dOB = sender.date
    }
    
    @IBOutlet var selectedGenderOutlet: UILabel!
    @IBOutlet var genderPickerCellOutlet: UITableViewCell!
    @IBOutlet var genderPickerOutlet: UIPickerView!
    //refer to datasource for genderSelection
    private var genderPickerManager: GenderSelect?

    override func viewWillAppear(_ animated: Bool) {
        //set up facebook button title as signup or sign in
        isSignup ?
            singupAndSignInWithFacebookOutlet.setTitle("CONTINUE WITH FACEBOOK", for: .normal) : singupAndSignInWithFacebookOutlet.setTitle("SIGN UP WITH FACEBOOK", for: .normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        genderPickerManager = GenderSelect(picker: genderPickerOutlet)
        genderPickerManager?.delegate = self
        genderPickerOutlet.dataSource = genderPickerManager
        genderPickerOutlet.delegate = genderPickerManager
        dateOfBirthOutlet.isHidden = true
        genderPickerOutlet.isHidden = true
        forgotPasswordOutlet.isHidden = isSignup
        
        
        

        

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


//MARK: GenderpickerDataSource
extension StaticLoginControllerTableView: GenderPickerDataSource {
    func didPickGender(gender: String) {
        turnOffandOnCellAccesory(cell: genderPickerCellOutlet, didFillField: true)
        selectedGenderOutlet.text = gender
        currentGender = gender
    
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
    
    
}







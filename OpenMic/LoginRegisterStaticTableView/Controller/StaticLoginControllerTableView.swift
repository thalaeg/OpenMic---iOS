//
//  StaticLoginControllerTableView.swift
//  OpenMic
//
//  Created by Michael Metzger  on 6/1/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class StaticLoginControllerTableView: UITableViewController {

    @IBOutlet var datePickerCell: UITableViewCell!
    
    @IBOutlet var dateOfBirthOutlet: UIDatePicker!
    
    @IBOutlet var genderPickerOutlet: UIPickerView!
    private var genderPickerManager: GenderSelect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.tableView.tableFooterView = UIView()
        genderPickerManager = GenderSelect(picker: genderPickerOutlet)
        genderPickerOutlet.dataSource = genderPickerManager
        genderPickerOutlet.delegate = genderPickerManager
       
        dateOfBirthOutlet.isHidden = true

    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 3 {
            
            dateOfBirthOutlet.isHidden = !dateOfBirthOutlet.isHidden
    
           self.tableView.reloadRows(at: [IndexPath(item: 4, section: 0)], with: .top)
        
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 4 {
            switch dateOfBirthOutlet.isHidden {
            case true:
                return 0
            default:
                return UITableViewAutomaticDimension
            }
        } else {
            return UITableViewAutomaticDimension
        }
        
    }

   
}

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
        genderPickerOutlet.isHidden = true

    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        switch indexPath.row {
        case 5:
            genderPickerOutlet.isHidden = !genderPickerOutlet.isHidden
            loadPickerView(atPath: 6)
        case 3:
            dateOfBirthOutlet.isHidden = !dateOfBirthOutlet.isHidden
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
        case 6:
            return genderPickerOutlet.isHidden ? 0 : UITableViewAutomaticDimension
            
        case 4:
            return dateOfBirthOutlet.isHidden ? 0 : UITableViewAutomaticDimension
        default:
            return UITableViewAutomaticDimension
        }
        

        
    }

   
}

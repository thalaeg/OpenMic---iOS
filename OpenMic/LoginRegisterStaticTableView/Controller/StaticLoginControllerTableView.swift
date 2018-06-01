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
    private var shouldBehidden = true
    override func viewDidLoad() {
        super.viewDidLoad()
       

        

     
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 3 {
            shouldBehidden = !shouldBehidden
    
           self.tableView.reloadRows(at: [IndexPath(item: 4, section: 0)], with: .top)
        
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 4 {
            switch shouldBehidden {
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

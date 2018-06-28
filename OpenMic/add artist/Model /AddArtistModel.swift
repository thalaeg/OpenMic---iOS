//
//  AddArtistModel.swift
//  OpenMic
//
//  Created by Michael Metzger  on 6/28/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit


class AddArtistModel: NSObject {
    
    private var tableView: UITableView
    
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        
        Endpoints.topForty.getCall { (error, json) in
            print("error \(error), json \(json)")
        }

    }
    
}



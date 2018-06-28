//
//  AddArtistModel.swift
//  OpenMic
//
//  Created by Michael Metzger  on 6/28/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit
import SwiftyJSON


class AddArtistModel: NSObject {
    
    private var tableView: UITableView
    
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        
        Endpoints.topForty.getCall { (error, json) in
            if let json = json {
                let jsonArray = JSON(json)["results"].arrayValue
                let arrayOfUsers = jsonArray.map{CurrentUser.init(json: $0)}
                print("jsonArray \(arrayOfUsers)")
            }
            //handle error
            print("error \(error)")
        }

    }
    
}



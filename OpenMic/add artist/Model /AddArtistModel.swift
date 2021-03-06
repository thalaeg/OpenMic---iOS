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
    private var users = [CurrentUser]()
    private var currentUser: CurrentUser?
    
    
    
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        CurrentUser.getCurrentUserfromFirebase { (currentUser) in
            self.currentUser = currentUser
            Endpoints.topForty.getCall { (error, json) in
                if let json = json {
                    let jsonArray = JSON(json)["results"].arrayValue
                    //reload
                    self.users = jsonArray.map{CurrentUser.init(json: $0)}
                    self.users = self.users.filter{$0.userName != currentUser.userName}
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
}



extension AddArtistModel: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! AddArtistTableViewCell
        cell.setupCell(user: users[indexPath.row])
        return cell
    }
    
    
}






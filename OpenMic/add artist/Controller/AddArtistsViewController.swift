//
//  AddArtistsViewController.swift
//  OpenMic
//
//  Created by Michael Metzger  on 6/20/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class AddArtistsViewController: UIViewController {
    
    private var addArtistModel: AddArtistModel?
    
    
    @IBOutlet private var tableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addArtistModel = AddArtistModel(tableView: tableView)
        
        
    }


}


//
//  BaseViewHiddenNav.swift
//  OpenMic
//
//  Created by Michael Metzger  on 5/30/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class BaseViewHiddenNav: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
 
    

   

}

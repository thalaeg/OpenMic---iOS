//
//  LoginSelectViewController.swift
//  OpenMic
//
//  Created by Michael Metzger  on 5/30/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

@IBDesignable
class LoginSelectViewController: BaseViewHiddenNav {

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addBackgroundImage(assetName: "backgroundLoginSelect.png")
        
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        addBackgroundImage(assetName: "backgroundLoginSelect.png")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

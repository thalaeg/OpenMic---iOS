//
//  StageNameViewController.swift
//  OpenMic
//
//  Created by Michael Metzger  on 6/8/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit
class StageNameViewController: UIViewController {
    
    @IBOutlet var usernameTextFieldOutlet: UITextField!
    @IBOutlet var fieldContainerView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        customizeButtons()
    }
    

}

@IBDesignable extension StageNameViewController {
    private func customizeButtons() {
        
        //right button
        let nextButton = UIButton()
        nextButton.frame = CGRect(x: 0, y: 0, width: 50, height: 21)
        nextButton.setTitle("Next", for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)

        nextButton.backgroundColor = #colorLiteral(red: 0.7647058824, green: 0, blue: 0.003921568627, alpha: 1)
        nextButton.layer.cornerRadius = 15
        let rightbarbuttonItem = UIBarButtonItem(customView: nextButton)
        self.navigationItem.rightBarButtonItem = rightbarbuttonItem
        
        //left button
        let skipFornow = UIButton()
        skipFornow.frame = CGRect(x: 0, y: 0, width: 100, height: 21)
        skipFornow.setTitle("Skip for now", for: .normal)
    
        skipFornow.setTitleColor(#colorLiteral(red: 0.7647058824, green: 0, blue: 0.003921568627, alpha: 1), for: .normal)
        skipFornow.tintColor = #colorLiteral(red: 0.7647058824, green: 0, blue: 0.003921568627, alpha: 1)

        skipFornow.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        let leftbarButtonItem = UIBarButtonItem(customView: skipFornow)
        self.navigationItem.leftBarButtonItem = leftbarButtonItem
        
        //set textfield border
        
        usernameTextFieldOutlet.layer.borderColor = #colorLiteral(red: 0.7647058824, green: 0, blue: 0.003921568627, alpha: 1)
        usernameTextFieldOutlet.layer.borderWidth = 1.0
        usernameTextFieldOutlet.layer.cornerRadius = 5
        
        //container view border
        
        fieldContainerView.layer.borderWidth = 1.0
        fieldContainerView.layer.borderColor = #colorLiteral(red: 0.8078431373, green: 0.8078431373, blue: 0.8078431373, alpha: 1)
        
       
        

    }
    
}

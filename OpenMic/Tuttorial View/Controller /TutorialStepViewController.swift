//
//  TutorialStepViewController.swift
//  Dart
//
//  Created by Michael Metzger  on 5/3/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class TutorialStepViewController: UIViewController {

    @IBOutlet var titleLable: UILabel!
    
    @IBOutlet var messageLabel: UILabel!
    
    @IBOutlet var image: UIImageView!
    
    @IBOutlet var topImageConstraint: NSLayoutConstraint!
    @IBOutlet var distcriptionConstraint: NSLayoutConstraint!
    
    
    var header: String?
    var message: String?
    var imageForSlide: UIImage?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        titleLable.text = header
        messageLabel.text = message
        image.image = imageForSlide
        
    }
    
    
    
    
    

}

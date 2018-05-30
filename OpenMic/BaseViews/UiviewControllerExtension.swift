//
//  UiviewControllerExtension.swift
//  OpenMic
//
//  Created by Michael Metzger  on 5/30/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit


extension UIViewController {
    func addBackgroundImage(assetName: String) {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: assetName)
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
}





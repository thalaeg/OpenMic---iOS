//
//  ProfileEditCollectionReusableView.swift
//  OpenMic
//
//  Created by Michael Metzger  on 8/4/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class ProfileEditCollectionReusableView: UICollectionReusableView {
    
    override func awakeFromNib() {
        
     blurredBackGroundView.addBlueEffect()
    }
    
  
    
    
    @IBOutlet var blurredBackGroundView: UIView!
    
    @IBOutlet var profilePhoto: UIImageView!
    
    @IBOutlet var upComingRecentSequeController: UISegmentedControl!
    
    @IBAction func upcomingRecentSequeAction(_ sender: UISegmentedControl) {
    }
    
    
    override func layoutSubviews() {
        //blurredBackGroundView.addBlueEffect()
    }
    
    
}





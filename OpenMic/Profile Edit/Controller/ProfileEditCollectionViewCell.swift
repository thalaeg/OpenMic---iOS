//
//  ProfileEditCollectionViewCell.swift
//  OpenMic
//
//  Created by Michael Metzger  on 8/5/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class ProfileEditCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var flyerImage: UIImageView!
    
    func setCellImage(with Image: UIImage) {
        
        flyerImage.image = Image
        
    }
    
    
}

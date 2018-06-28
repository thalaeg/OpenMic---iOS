//
//  AddArtistTableViewCell.swift
//  OpenMic
//
//  Created by Michael Metzger  on 6/28/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit
import SDWebImage

class AddArtistTableViewCell: UITableViewCell {

    @IBOutlet var userImage: UIImageView!
    
    @IBOutlet var userName: UILabel!
    
    @IBOutlet var userBio: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(user: CurrentUser) {
        
        userName.text = user.userName
        userBio.text = user.userBio
        if let photoCheck = user.profilePic {
            userImage.sd_setImage(with: URL(string: photoCheck), placeholderImage: UIImage(named: "genreIcon.png"))
            
        }
        
        
        
    }

}

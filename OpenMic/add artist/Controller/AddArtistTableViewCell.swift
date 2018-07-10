//
//  AddArtistTableViewCell.swift
//  OpenMic
//
//  Created by Michael Metzger  on 6/28/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit
import SDWebImage
import SwiftyJSON

class AddArtistTableViewCell: UITableViewCell {
    
    private var currentArtist: CurrentUser?

    @IBOutlet var userImage: UIImageView!
    
    @IBOutlet var userName: UILabel!
    
    @IBOutlet var userBio: UILabel!
    
    
    @IBAction func addArtistAction(_ sender: Any) {
        guard let selectedArtist = currentArtist else {return}
        BasePaths.users.getUIDBase()?.observe(.value, with: { (snapShot) in
            let inputDict = snapShot.value as? [String : Any] ?? [:]
            let user = CurrentUser.init(json: JSON(inputDict))
            let parameters = ["user" : user.userName, "artist" : selectedArtist.userName ]
            Endpoints.addArtist.postWithEncoding(with: parameters) { (json, error) in
                print(json)
                
            }
            
        })
        
        
        
        
    }
    


    func setupCell(user: CurrentUser) {
        currentArtist = user
        userName.text = user.userName
        userBio.text = user.userBio
        if let photoCheck = user.profilePic {
            userImage.sd_setImage(with: URL(string: photoCheck), placeholderImage: UIImage(named: "genreIcon.png"))
            
        }
        
        
        
    }

}

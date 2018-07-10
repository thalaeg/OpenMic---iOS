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
    
    private var addArtistDelegate: AddArtistDelegate?
    
    private var currentArtist: CurrentUser?

    @IBOutlet var userImage: UIImageView!
    
    @IBOutlet var userName: UILabel!
    
    @IBOutlet var userBio: UILabel!
    
    @IBOutlet var addArtistOutlet: UIButton!
    
    @IBAction func addArtistAction(_ sender: Any) {
        guard let selectedArtist = currentArtist else {return}
        addArtistDelegate?.addArtist(selectedArtist: selectedArtist)
    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addArtistOutlet.setTitle("Add", for: .normal)
        addArtistDelegate = self
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

extension AddArtistTableViewCell: AddArtistDelegate {
    
    
    func artistAdded(success: Bool, message: String) {
        
        if success {
            addArtistOutlet.setTitle("Added", for: .normal)
        } 
        
    }
    
    
    
    
}








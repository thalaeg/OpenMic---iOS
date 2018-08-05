//
//  AddArtistTableViewCell.swift
//  OpenMic
//
//  Created by Michael Metzger  on 6/28/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit
import SDWebImage

@IBDesignable
class AddArtistTableViewCell: UITableViewCell {
    
    private var addArtistDelegate: AddArtistDelegate?
    
    private var currentArtist: CurrentUser?

    @IBOutlet var userImage: UIImageView!
    
    @IBOutlet var userFirstAndLast: UILabel!
    @IBOutlet var userName: UILabel!
    
    @IBOutlet var userBio: UILabel!
    
    @IBOutlet var addArtistOutlet: UIButton!
    
    @IBAction func addArtistAction(_ sender: Any) {
        guard let selectedArtist = currentArtist else {return}
        addArtistDelegate?.addArtist(selectedArtist: selectedArtist)
    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
        addArtistDelegate = self
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCellLayersAndImage()
    }
    
 
    


    func setupCell(user: CurrentUser) {
        currentArtist = user
        userName.text = user.userName
        userBio.text = user.userBio
        userFirstAndLast.text = user.firstName + user.lastName
        
        if let photoCheck = user.profilePic {
            userImage.sd_setImage(with: URL(string: photoCheck), placeholderImage: UIImage(named: "genreIcon.png"))
            
        } else {
          userImage.image = #imageLiteral(resourceName: "kanyeWest-profile")
        }
        
        
        
    }

}

extension AddArtistTableViewCell: AddArtistDelegate {
    func removedArtist(success: Bool) {
        if success {
            addArtistOutlet.setTitle("ADD  ", for: .normal)
            addArtistOutlet.setImage(#imageLiteral(resourceName: "plusIcon"), for: .normal)
        }
    }
    
    
    
    func artistAdded(success: Bool, message: String) {
        
        if success {
            addArtistOutlet.setTitle("ADDED  ", for: .normal)
             addArtistOutlet.setImage(#imageLiteral(resourceName: "minusIcon"), for: .normal)
        } 
        
    }
    
    
}


extension AddArtistTableViewCell {
    
    private func setupCellLayersAndImage() {
        addArtistOutlet.setTitle("ADD  ", for: .normal)
        
        addArtistOutlet.semanticContentAttribute =  .forceRightToLeft

        userImage.roundBorderless()
   
        
        
    }
    
    
}








//
//  ProfileEditCollectionReusableView.swift
//  OpenMic
//
//  Created by Michael Metzger  on 8/4/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class ProfileEditCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var spotifyOutlet: UIImageView!
    @IBOutlet weak var youTubeImageView: UIImageView!
    @IBOutlet weak var soundCloudImageView: UIImageView!
    
    @IBOutlet weak var amazonOutlet: UIImageView!
    @IBOutlet weak var deezerOutlet: ProfileEditGradientView!
    
    var performSegueDelegagte: PerformSegueProfileDelegate?
    private var currentUSer: CurrentUser?
    
    override func awakeFromNib() {
       //blurredBackGroundView.addBlueEffect()
        profilePhotoFront.roundBorderless2()
        upComingRecentSequeController.addUnderlineForSelectedSegment()
       
    }
    
    @IBOutlet var editProfileButtonOutlet: UIButton!
    
    @IBAction func editProfifileAction(_ sender: Any) {
        guard let currentUserCheck = currentUSer else {return}
        performSegueDelegagte?.performSegueWithUserInfo(curentUser: currentUserCheck)
        
    }
    
    @IBOutlet var profileNameFull: UILabel!
    
    @IBOutlet var profilePhotoFront: UIImageView!
    
    @IBOutlet var profileUserName: UILabel!
    @IBOutlet var blurredBackGroundView: UIView!
    
    @IBOutlet var profilePhoto: UIImageView!
    
    @IBOutlet var upComingRecentSequeController: UISegmentedControl!
    
    @IBAction func upcomingRecentSequeAction(_ sender: UISegmentedControl) {
        upComingRecentSequeController.changeUnderlinePosition()
      
    }
    
    
    
    func setupProfileCell(currentUser: CurrentUser, selectedPlatforms: [PlatFormType]) {
        self.currentUSer = currentUser
        profileNameFull.text = ("\(currentUser.firstName)  \(currentUser.lastName)")
        profileUserName.text = currentUser.userName
        unhideSelectedPlatforms(platforms: selectedPlatforms)
    }
    
    private func unhideSelectedPlatforms(platforms: [PlatFormType]) {
        
        platforms.forEach { (platform) in
            switch platform {
            case .spotify:
                spotifyOutlet.isHidden = false
            case .youtube:
                youTubeImageView.isHidden = false
            case .soundcloud:
                soundCloudImageView.isHidden = false
            case .amazon:
                amazonOutlet.isHidden = false
                
            case .deezer:
                deezerOutlet.isHidden = false
    
            }
        }
        
        
    }


    
}


protocol PerformSegueProfileDelegate {
    func performSegueWithUserInfo(curentUser: CurrentUser)
}







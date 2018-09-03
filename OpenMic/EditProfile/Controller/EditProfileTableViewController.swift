//
//  EditProfileTableViewController.swift
//  OpenMic
//
//  Created by Mike on 8/11/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class EditProfileTableViewController: UITableViewController, UITextViewDelegate {
    internal var currentUser: CurrentUser?
    internal var userFullName: String?
    internal var username: String?
    internal var userBio: String?
    internal var userLocation: String?
    private var saveProfileUpdatesDelegate: SaveProfileUpdatesDelegate?
    private var imagePickerDelegate: ChooseImage?
    private let segueDestination = "goToLinkPlatform"
    private var platformsSelected = [PlatFormType]()
    
    @IBOutlet weak var youtubeOutlet: UISwitch!
    @IBOutlet weak var spotifyOutlet: UISwitch!
    @IBOutlet weak var soundCloudOutlet: UISwitch!
    @IBOutlet weak var amazonOutlet: UISwitch!
    @IBOutlet weak var deezerOutlet: UISwitch!
    
    
    @IBAction func choosePlatform(_ sender: UISwitch) {
        let segueDestination = "goToLinkPlatform"
        if sender.isOn {
            switch sender.tag {
            case 0:
                performSegue(withIdentifier: segueDestination, sender: PlatFormType.youtube)
                platformsSelected.append(PlatFormType.youtube)
            case 1:
                performSegue(withIdentifier: segueDestination, sender: PlatFormType.spotify)
                platformsSelected.append(PlatFormType.spotify)
            case 2:
                performSegue(withIdentifier: segueDestination, sender: PlatFormType.soundcloud)
                platformsSelected.append(PlatFormType.soundcloud)
            case 3:
                performSegue(withIdentifier: segueDestination, sender: PlatFormType.amazon)
                platformsSelected.append(PlatFormType.amazon)
            case 4:
                performSegue(withIdentifier: segueDestination, sender: PlatFormType.deezer)
                platformsSelected.append(PlatFormType.deezer)
            default:
                return
            }
            
        } else {
            platform =
            platformsSelected
        }
        
        
    }
    
    @IBOutlet weak var userImage: UIImageView!
    
    
    @IBOutlet weak var fullNameOutlet: UITextField!
    
    @IBOutlet weak var usernameOutlet: UITextField!
    @IBOutlet weak var bioOutlet: UITextView!
    @IBOutlet weak var locationOutlet: UITextField!
    
    @IBAction func changeUserImage(_ sender: Any) {
        self.pickCameraTypeAlert(title: "", message: "") { (cameraType) in
            switch cameraType {
            case .camera:
                self.imagePickerDelegate = ChooseImage(vc: self, source: .camera)
            case .library:
                self.imagePickerDelegate = ChooseImage(vc: self, source: .photoLibrary)
            }
            self.imagePickerDelegate?.updatePhotoDelegate = self
            self.imagePickerDelegate?.presentView()
        }
        
        
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveProfileAcrtion(_ sender: Any) {
        saveProfileUpdatesDelegate?.updateUserParameters()
    }
    
    
    @IBAction func fullNameTextAction(_ sender: UITextField) {
        userFullName = sender.text
    }
    
    @IBAction func usernameChangedAction(_ sender: UITextField) {
        username = sender.text
    }
    
    
    
    @IBAction func locationChangedAction(_ sender: UITextField) {
        userLocation = sender.text
    }
    
  
    
    func textViewDidChange(_ textView: UITextView) {
        userBio = textView.text
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let usercheck = currentUser {
            fullNameOutlet.text = "\(usercheck.firstName) \(usercheck.lastName)"
            usernameOutlet.text = usercheck.userName
            self.saveProfileUpdatesDelegate = self
        }
        

    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

}



extension EditProfileTableViewController: SaveProfileUpdatesDelegate, UpDatePhotoDelegate, PlatformSelectedControlDelegate {
    func didRemovePlatform(platform: PlatFormType) {
       platformsSelected = platformsSelected.filter{$0 != platform}
        switch platform.getTag(){
        case 0:
            youtubeOutlet.isOn = !youtubeOutlet.isOn
        case 1:
            spotifyOutlet.isOn = !spotifyOutlet.isOn
        case 2:
            soundCloudOutlet.isOn = !soundCloudOutlet.isOn
        case 3:
            amazonOutlet.isOn = !amazonOutlet.isOn
        case 4:
            deezerOutlet.isOn = !deezerOutlet.isOn
        default:
            return
        }
        
        
    }
    
   
    
    func didAddplatrom(platform: PlatFormType) {
        // implement offline saving here.
       // platformsSelected.append(platform)
        
    }
    
    func upDatePhoto(image: UIImage) {
        userImage.image = image
    }
    
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueDestination {
            guard let vc = segue.destination as? SelectPlatformViewController, let platform = sender as? PlatFormType else {return}
            vc.platform = platform
            vc.platformSelectedControlDelegate = self
        }
    }
    
  
    
    
    
}


protocol PlatformSelectedControlDelegate {
    func didRemovePlatform(platform: PlatFormType)
    
    func didAddplatrom(platform: PlatFormType)
}








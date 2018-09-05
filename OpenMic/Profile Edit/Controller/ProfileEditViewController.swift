//
//  ProfileEditViewController.swift
//  OpenMic
//
//  Created by Michael Metzger  on 8/4/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class ProfileEditViewController: UIViewController {
    
    

    @IBOutlet var collectionView: UICollectionView!
    private var selectePlatforms = [PlatFormType]()
    
    
    private var collectionViewManager: ProfileEditModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        collectionViewManager = ProfileEditModel(collectionView: collectionView, viewController: self)
        collectionViewManager?.dataSource = self

    }

    

}

extension ProfileEditViewController: PerformSegueProfileDelegate, ProfileEditModelDataSource {
    func refreshPlatforms(platfrorms: [PlatFormType]) {
        self.selectePlatforms = platfrorms
    }
    
    func performSegueWithUserInfo(curentUser: CurrentUser) {
        self.performSegue(withIdentifier: "adjustProfile", sender: curentUser)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adjustProfile" {
            guard let nav =  segue.destination as? UINavigationController, let vc = nav.viewControllers.first as? EditProfileTableViewController, let userTopass = sender as? CurrentUser else {return}
            vc.platformsSelected = selectePlatforms
            vc.currentUser = userTopass
            
        }
    }
    
    
}




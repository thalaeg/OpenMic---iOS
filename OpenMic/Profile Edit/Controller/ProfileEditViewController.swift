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
    
    @IBOutlet weak var platformSelectScrollview: UIScrollView!
    
    private var collectionViewManager: ProfileEditModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        collectionViewManager = ProfileEditModel(collectionView: collectionView, viewController: self)

    }

    

}

extension ProfileEditViewController: PerformSegueProfileDelegate {
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




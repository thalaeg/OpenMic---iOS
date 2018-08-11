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
    
    private var collectionViewManager: ProfileEditModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewManager = ProfileEditModel(collectionView: collectionView, viewController: self)

    }

    

}




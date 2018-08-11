//
//  ProfileEditCollectionViewModel.swift
//  OpenMic
//
//  Created by Michael Metzger  on 8/4/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class ProfileEditModel: NSObject {
    
    private var collectionView: UICollectionView
    private var viewController: UIViewController
    private var currentUSerInfo: CurrentUser?
    
    private var placeHolderImages = [#imageLiteral(resourceName: "upcomingFlyer"), #imageLiteral(resourceName: "recentFlyer"), #imageLiteral(resourceName: "attendedFlyer"), #imageLiteral(resourceName: "recentFlyer"), #imageLiteral(resourceName: "attendedFlyer"),#imageLiteral(resourceName: "attendedFlyer"),#imageLiteral(resourceName: "attendedFlyer"),#imageLiteral(resourceName: "attendedFlyer"),#imageLiteral(resourceName: "attendedFlyer"),#imageLiteral(resourceName: "attendedFlyer"),#imageLiteral(resourceName: "attendedFlyer"),#imageLiteral(resourceName: "attendedFlyer"),#imageLiteral(resourceName: "attendedFlyer"),#imageLiteral(resourceName: "attendedFlyer"),#imageLiteral(resourceName: "attendedFlyer"),#imageLiteral(resourceName: "recentFlyer"),#imageLiteral(resourceName: "recentFlyer"),#imageLiteral(resourceName: "recentFlyer"),#imageLiteral(resourceName: "recentFlyer"),#imageLiteral(resourceName: "recentFlyer"),#imageLiteral(resourceName: "recentFlyer")]
    
    
    init<T: UIViewController>(collectionView: UICollectionView, viewController: T)where T:PerformSegueProfileDelegate {
        self.collectionView = collectionView
        self.viewController = viewController
        super.init()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        
        let width = (viewController.view.frame.size.width - 20) / 3
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: 150)
        getProfileInformation()
    }
    
    
    
    private func getProfileInformation() {
        CurrentUser.getSingleUserfromAPI { (currentUser) in
            self.currentUSerInfo = currentUser
            self.collectionView.reloadData()
        }
        
    }
    
}




extension ProfileEditModel: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return placeHolderImages.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ProfileEditCollectionViewCell
        cell.setCellImage(with: placeHolderImages[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "mainHeader", for: indexPath) as! ProfileEditCollectionReusableView
        if let currentUserProfileInfo = currentUSerInfo, let viewControllerConforming = viewController as? PerformSegueProfileDelegate  {
            header.setupProfileCell(currentUser: currentUserProfileInfo)
            header.performSegueDelegagte = viewControllerConforming
        }
        return header
    }
    
    
    
}



//
//  FaveGenreModel.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/20/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class FaveGenreModel: NSObject {
    
    private var collectionView: UICollectionView
    private var genres = [Genre]()
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        setFlowLayout()
        getGeners()
        
       
    }
    
    private func getGeners() {
        
        Genre.readGenres { (genres) in
            self.genres = genres
            self.collectionView.reloadData()
            
        }
    }
    
    private func setFlowLayout() {
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        //let screenHeight = screenSize.height
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: screenWidth/2, height: screenWidth/2)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collectionView.collectionViewLayout = layout
    }
}


extension FaveGenreModel: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres.count
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FavGenreCollectionViewCell
        cell.loadCell(genre: genres[indexPath.row])
        return cell
    }
    
    
}




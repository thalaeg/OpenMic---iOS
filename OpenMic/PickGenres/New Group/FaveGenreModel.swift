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
        getGeners()
        
       
    }
    
    private func getGeners() {
        
        Genre.readGenres { (genres) in
            self.genres = genres
            self.collectionView.reloadData()
            
        }
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




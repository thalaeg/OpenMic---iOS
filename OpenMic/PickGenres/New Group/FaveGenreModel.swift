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
    private var selectedGenres = [Genre]()
    
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

        return prepareCell(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selected = genres[indexPath.row]
        let isPresent = selectedGenres.contains{$0.genre == selected.genre}
        switch isPresent {
        case true:
           selectedGenres = selectedGenres.filter{$0.genre != selected.genre}
            
        case false:
            selectedGenres.append(selected)
        }
        
        collectionView.reloadItems(at: [indexPath])
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            _ = prepareCell(indexPath: indexPath)
    }
    
    
    private func prepareCell(indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FavGenreCollectionViewCell
        let genre = genres[indexPath.row]
        let isPresent = selectedGenres.contains{$0.genre == genre.genre}
        switch isPresent {
        case true:
            cell.showCellSelected(genre: genre)
        case false:
            cell.loadCell(genre: genre)
        }
        
        return cell
    }
    
    
}




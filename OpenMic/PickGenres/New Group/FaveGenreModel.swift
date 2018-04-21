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
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        getGeners()
    }
    
    private func getGeners() {
        
        Genre.readGenres { (genres) in
            
            
        }
   
    }
    
    
    
    
}


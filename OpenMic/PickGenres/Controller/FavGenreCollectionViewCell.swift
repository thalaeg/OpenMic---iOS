//
//  FavGenreCollectionViewCell.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/20/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit
import Nuke

class FavGenreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var genreImage: UIImageView!
    
    @IBOutlet var genreName: UILabel!
    
    
    func loadCell(genre: Genre) {
        
        genreName.text = genre.genre
        guard let url = URL(string: genre.genreCover) else {return}
        Nuke.Manager.shared.loadImage(with: url, into: genreImage)
        
        
    }
    
   
    func showCellSelected(genre: Genre) {
        
        guard let url = URL(string: genre.genreCover)  else {return}
        let request = Request(url: url)
        Nuke.Manager.shared.loadImage(with: request, token: nil) { (image) in
            if let image = image.value {
                self.genreName.text = genre.genre
                self.genreImage.image = image
                self.genreImage.setImageColor(color: .gray)
                
            }
        }
      
        
    }
}




extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}

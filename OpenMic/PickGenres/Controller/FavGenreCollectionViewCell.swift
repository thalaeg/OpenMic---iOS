//
//  FavGenreCollectionViewCell.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/20/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit
import SDWebImage

class FavGenreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var genreImage: UIImageView!
    
    @IBOutlet var genreName: UILabel!
    
    
    func loadCell(genre: Genre) {
        
        genreName.text = genre.genre
        
        genreImage.sd_setImage(with: URL(string: genre.genreCover), placeholderImage: UIImage(named: "alternative_icon.png"))
        
        
    }
    
   
    func showCellSelected(genre: Genre, image: UIImage) {
        
         genreName.text = genre.genre
        genreImage.image = image
        genreImage.setImageColor(color: .gray)
        
    }
}




//extension UIImage {
//    func setImageColor() {
//        self.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
//        self
//        self.tintColor = UIColor.gray
//
//    }
//}

extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}

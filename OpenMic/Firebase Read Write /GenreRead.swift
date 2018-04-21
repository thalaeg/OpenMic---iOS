//
//  GenreReadProtocol.swift
//  OpenMic
//
//  Created by Michael Metzger  on 4/20/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import Foundation
import SwiftyJSON


struct Genre {
    var genre: String
    var genreCover: String
    
    
    
    static func readGenres(completion: @escaping (_ geners: [Genre]) -> Void) {
        
        BasePaths.Genre.getNonUIDBase().observeSingleEvent(of: .value) { (snapShot) in
            let snapDic = snapShot.value as? [String: Any] ?? [:]
            let genreArray = snapDic.map{Genre(genre: $0.key, genreCover: $0.value as? String ?? "")}
            
            completion(genreArray)
            
        }
        
    }
    
}

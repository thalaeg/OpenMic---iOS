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
    var Genre: String
    var GenreCover: String
    
    static func readGenres() {
        
        BasePaths.Genre.getNonUIDBase().observeSingleEvent(of: .value) { (snapShot) in
            let snapDic = snapShot.value as? [String: Any] ?? [:]
        }
        
    }
    
}

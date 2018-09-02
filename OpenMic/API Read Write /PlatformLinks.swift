//
//  PlatformLinks.swift
//  OpenMic
//
//  Created by Mike on 9/1/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

enum PlatFormType: String {
    case spotify = "Spotify"
    case youtube = "YouTube"
    case soundcloud = "SOUNDCLOUD"
    case amazon
    case deezer = "DEEZER"
    
    func platFormImage () -> UIImage {
        switch self {
        case .spotify:
            return #imageLiteral(resourceName: "Spotify")
        case .youtube:
            return #imageLiteral(resourceName: "youtube")
        case .soundcloud:
            return #imageLiteral(resourceName: "soundcloud")
        case .amazon:
            return #imageLiteral(resourceName: "amazon")
        case .deezer:
            return #imageLiteral(resourceName: "Deezer-logo")
        }
        
    }
    
    
}


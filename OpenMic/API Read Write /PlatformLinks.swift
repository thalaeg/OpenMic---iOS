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
    
    func getTag() -> Int {
        switch self {
        case .spotify:
            return 1
        case .youtube:
            return 0
        case .soundcloud:
            return 2
        case .amazon:
            return 3
        case .deezer:
            return 4
        }
    }
    
    
   static func getTagMatch(tag: Int) -> PlatFormType? {
        switch tag {
        case 1:
            return .spotify
        case 0:
            return .youtube
        case 2:
            return .soundcloud
        case 3:
            return .amazon
        case 4:
            return .deezer
        default:
            return nil
        }
    }
    
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


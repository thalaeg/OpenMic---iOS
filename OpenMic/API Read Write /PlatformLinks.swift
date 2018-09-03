//
//  PlatformLinks.swift
//  OpenMic
//
//  Created by Mike on 9/1/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit
import Firebase

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
    
    static func getStringMatch(inputString: String) -> PlatFormType? {
        switch inputString {
        case self.spotify.rawValue:
            return self.spotify
            
        case self.youtube.rawValue:
            return self.youtube
            
        case self.soundcloud.rawValue:
            return self.soundcloud
            
        case self.amazon.rawValue:
            return self.amazon
            
        case self.deezer.rawValue:
            return self.deezer
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
    
    
    
    func mainPageImage () -> UIImage {
        switch self {
        case .spotify:
            return #imageLiteral(resourceName: "SpotifyMain")
        case .youtube:
            return #imageLiteral(resourceName: "youtubeMain")
        case .soundcloud:
            return #imageLiteral(resourceName: "soundCloudMain")
        case .amazon:
            return #imageLiteral(resourceName: "amazonMain")
        case .deezer:
            return #imageLiteral(resourceName: "DeezerMain")
        }
    }
    
    static func readCurrentUserSelectPlaformsFromFirebase(completion: @escaping (_ selectedPlatforms: [PlatFormType]) -> Void ) {
        guard let path =  BasePaths.savedPlatformLinks.getUIDBase() else {return}
        path.observe(.value) { (snapShot) in
            guard let platforms = snapShot.value as? [String] else {return}
            let platformTypeArray = platforms.compactMap{getStringMatch(inputString: $0)}
            completion(platformTypeArray)
            
            
            
        }
        
        
    }
    
    // read selected platforms 
}






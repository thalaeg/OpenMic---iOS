//
//  StringExtensions.swift
//  OpenMic
//
//  Created by Mike on 8/18/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import Foundation

extension String {
    
    func getFIrstAndLast() -> (first: String, last: String?) {
        
        let nameSet = self.components(separatedBy: " ")
         let firstName = nameSet[0]
        
        if nameSet.count > 1 {
            let lastName = nameSet[1]
            return (firstName, lastName)
        } else {
            return (firstName, nil)
        }
    }
    
    
}

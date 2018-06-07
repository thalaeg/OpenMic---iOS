//
//  DateFormatExtensions.swift
//  OpenMic
//
//  Created by Michael Metzger  on 6/7/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import Foundation

extension Date {
    
    func formatForUSer() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        formatter.locale = Locale.current
       return formatter.string(from: self)
        
    }
    
    func formatForDataBase() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: self)
    }

    
    
}

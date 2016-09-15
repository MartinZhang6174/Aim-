//
//  Utility.swift
//  Aim!
//
//  Created by Nelson Chow on 2016-09-14.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

import UIKit

class Utility {
    class func convertSecondsToTimeString(seconds: NSTimeInterval) -> String {
        
        let totalSeconds = Int(seconds)
        
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds / 60 ) % 60
        let seconds = totalSeconds % 60
        
        var hoursString = ""
        if hours > 0 {
            hoursString = "\(hours):"
        }
        
        var minutesString = ""
        if minutes < 10 {
            minutesString = "0\(minutes):"
        } else {
            minutesString = "\(minutes):"
        }
        
        var secondsString = ""
        if seconds < 10 {
            secondsString = "0\(seconds)"
        } else {
            secondsString = "\(seconds)"
        }
        
        return hoursString + minutesString + secondsString
    }
}

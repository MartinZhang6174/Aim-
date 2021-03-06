//
//  TimerManager.swift
//  Aim!
//
//  Created by Nelson Chow on 2016-09-01.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//
//

import UIKit

class TimerManager {

    // MARK: - Properties
    static let notificationSecondTick = "TimerNotificationSecondTick"
    static let notificationComplete = "TimerNotificationComplete"
    
    let TIME_INTERVAL: TimeInterval = 0.01    // Change back to 1.
    var delegate: AimSessionTimerLabelDisplayDelegate?
    
    var duration: TimeInterval = 0
    var elapsedTime: TimeInterval = 0
    
    var aimTimer: Timer?
    
    var isOn: Bool {
        get {
            if aimTimer != nil {
                return true
            } else {
                return false
            }
        }
    }
    
    /* 
    //  Refactored to Utility.swift
     
    var timeString: String {
        get {
            let totalSeconds = Int(self.elapsedTime)
            
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
 */
    
    // MARK: - Timer Functions
    func startTimer() {
        if !isOn {
            aimTimer = Timer.scheduledTimer(timeInterval: TIME_INTERVAL, target: self, selector: #selector(self.secondTick), userInfo: nil, repeats: true)
        }
    }
    
    func stopTimer() {
        if isOn {
            aimTimer?.invalidate()
            aimTimer = nil
        }
    }
    
    // MARK: - General Functions
    @objc func secondTick() {
        elapsedTime += 1
        
        print("\(self.elapsedTime)")
        NotificationCenter.default.post(name: Notification.Name(rawValue: TimerManager.notificationSecondTick), object: self)
        
//<<<<<<< HEAD
//        if let delegate = self.delegate {
//            delegate.updateTimerLabel(seconds)
//=======
        if self.elapsedTime == self.duration {
            self.stopTimer()
            NotificationCenter.default.post(name: Notification.Name(rawValue: TimerManager.notificationComplete), object: self)
//>>>>>>> origin/NelsonWorkingBranch
        }
    }
}

//// MARK: - Global Functions
//
//func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int){
//    return ((seconds / (3600)), ((seconds / 60) % 60), (seconds % 60))
//}
//
//func timeString(seconds: Int) -> String {
//    
//    let (h,m,s) = secondsToHoursMinutesSeconds(seconds)
//    
//    return String(format: "%0.2d:%0.2d:%0.2d", h, m, s)
//}

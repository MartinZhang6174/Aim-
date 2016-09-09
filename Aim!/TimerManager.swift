//
//  TimerManager.swift
//  Aim!
//
//  Created by Nelson Chow on 2016-09-01.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

import UIKit

class TimerManager {

    // MARK: - Properties
    let TIME_INTERVAL: NSTimeInterval = 1
    
    var seconds = 0
    var aimTimer = NSTimer()
    
    // MARK: - Timer Functions
    func startTimer() {
        if aimTimer.valid {
            aimTimer.invalidate()
        }
        resetTimer()
        aimTimer = NSTimer.scheduledTimerWithTimeInterval(TIME_INTERVAL, target: self, selector: #selector(self.incrementSecond), userInfo: nil, repeats: true)
    }
    
    func resetTimer() {
        if aimTimer.valid {
            aimTimer.invalidate()
        }
        seconds = 0
    }
    
    // MARK: - General Functions
    @objc func incrementSecond() {
        seconds += 1
        print("\(seconds)")
    }
    
}

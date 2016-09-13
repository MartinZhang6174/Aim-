//
//  SessionMainViewController.swift
//  Aim!
//
//  Created by Martin Zhang on 2016-08-22.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

import UIKit

class SessionMainViewController: UIViewController, AimSessionDurationInfoDelegate {
    
    var timerManager = TimerManager()
    
    @IBOutlet weak var aimTimerLabel: UILabel!
    @IBOutlet weak var aimSessionDurationInfoDisplayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SessionMainViewController.updateTimerLabel), name: TimerManager.notificationSecondTick, object: timerManager)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SessionMainViewController.timerComplete), name: TimerManager.notificationComplete, object: timerManager)
        
        aimTimerLabel.text = timerManager.timeString
    }
    
    // MARK: - AimSessionDurationInfoDelegate
    func getSessionDuration(duration: Int) {
        aimSessionDurationInfoDisplayLabel.text = "\(duration)-Minute-Long Session In Progress!"
        timerManager.duration = NSTimeInterval(duration * 60)
        timerManager.startTimer()
    }

    func getSessionDurationForSessionWithoutDurationLimits() {
        aimSessionDurationInfoDisplayLabel.text = "'Forever-long' Session In Progress!"
        timerManager.startTimer()
    }
    
    // MARK: - Actions
    @IBAction func endAimSessionButtonPressed(sender: AnyObject) {
        timerManager.stopTimer()
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - General Functions
    func updateTimerLabel() {
        aimTimerLabel.text = timerManager.timeString
    }

    func timerComplete() {
        
    }
}


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
        
        // Add observers to handle timer label update and completed timer.
        NotificationCenter.default.addObserver(self, selector: #selector(SessionMainViewController.updateTimerLabel), name: NSNotification.Name(rawValue: TimerManager.notificationSecondTick), object: timerManager)
        NotificationCenter.default.addObserver(self, selector: #selector(SessionMainViewController.timerComplete), name: NSNotification.Name(rawValue: TimerManager.notificationComplete), object: timerManager)
        
        updateTimerLabel()

    }
    
    // MARK: - AimSessionDurationInfoDelegate
    func getSessionDuration(_ durationInSeconds: TimeInterval) {
        aimSessionDurationInfoDisplayLabel.text = "\(Int(durationInSeconds / 60))-Minute-Long Session In Progress!"
        timerManager.duration = TimeInterval(durationInSeconds)
        timerManager.startTimer()
    }

    func getSessionDurationForSessionWithoutDurationLimits() {
        aimSessionDurationInfoDisplayLabel.text = "'Forever-long' Session In Progress!"
        timerManager.startTimer()
    }
    
    // MARK: - Actions
    @IBAction func endAimSessionButtonPressed(_ sender: AnyObject) {
        timerManager.stopTimer()
        
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - General Functions
    func updateTimerLabel() {
        let currentTime = timerManager.elapsedTime
        aimTimerLabel.text = Utility.convertSecondsToTimeString(currentTime)
    }
    
    func timerComplete() {
        // Do this when timer completes its full duration.
    }
}


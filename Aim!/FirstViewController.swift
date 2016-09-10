//
//  FirstViewController.swift
//  Aim!
//
//  Created by Martin Zhang on 2016-08-20.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var delegate: AimSessionDurationInfoDelegate?
//    var timerDelegate: AimSessionTimerLabelDisplayDelegate?
    var timerManager = TimerManager()
    
    // Outlets from FirstViewController
    @IBOutlet weak var defaultSessionDurationButton: UIButton!
    @IBOutlet weak var hourLongSessionDurationButton: UIButton!
    @IBOutlet weak var customizeSessionDurationButton: UIButton!
    @IBOutlet weak var startSessionWithoutTimeLimitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func viewWillAppear(animated: Bool) {
        timerManager.resetTimer()
        self.tabBarController?.tabBar.backgroundColor = UIColor.redColor()
    }

    @IBAction func defaultSessionDurationButtonPressed(sender: AnyObject) {
        print("defaultSessionDurationButtonPressed")
        timerManager.startTimer()
        performSegueWithIdentifier("showMainAimSessionSegue", sender: self)
        if let delegate = self.delegate {
            delegate.getSessionDuration(25)
        }
        
        // Doesn't work: 
        
//        print(self.timerManager.seconds)
        // Updating timer label content
//        if let timerLabelDelegate = self.timerDelegate {
//            timerLabelDelegate.updateTimerLabel(self.timerManager.seconds)
//        }
    }
    
    @IBAction func hourLongSessionDurationButtonPressed(sender: AnyObject) {
        print("hourLongSessionDurationButtonPressed")
        timerManager.startTimer()
        performSegueWithIdentifier("showMainAimSessionSegue", sender: self)
        if let delegate = self.delegate {
            delegate.getSessionDuration(60)
        }
    }
    
    @IBAction func customizeSessionDurationButtonPressed(sender: AnyObject) {
        print("customizeSessionDurationButtonPressed")
        
        // Display screen to customize session duration:
        
//        performSegueWithIdentifier("showMainAimSessionSegue", sender: self)
        
    }
    
    @IBAction func startSessionWithoutTimeLimitationButtonPressed(sender: AnyObject) {
        print("startSessionWithoutTimeLimitationButtonPressed")
        timerManager.startTimer()
        performSegueWithIdentifier("showMainAimSessionSegue", sender: self)
        if let delegate = self.delegate {
            delegate.getSessionDurationForSessionWithoutDurationLimits()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMainAimSessionSegue" {
            let mainSessionViewController = segue.destinationViewController as? SessionMainViewController
            
            if let sessionVC = mainSessionViewController {
                self.delegate = sessionVC
            }
        }
    }

}

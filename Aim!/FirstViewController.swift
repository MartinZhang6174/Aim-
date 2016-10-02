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
    var sessionManager = SessionManager()

    // Outlets from FirstViewController
    @IBOutlet weak var defaultSessionDurationButton: UIButton!
    @IBOutlet weak var hourLongSessionDurationButton: UIButton!
    @IBOutlet weak var customizeSessionDurationButton: UIButton!
    @IBOutlet weak var startSessionWithoutTimeLimitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.backgroundColor = UIColor.redColor()
    }

    @IBAction func defaultSessionDurationButtonPressed(sender: AnyObject) {
        print("defaultSessionDurationButtonPressed")
        performSegueWithIdentifier("showMainAimSessionSegue", sender: self)
        if let delegate = self.delegate {
            delegate.getSessionDuration(sessionManager.aimDefaultSessionDuration)
        }
        
    }
    
    @IBAction func hourLongSessionDurationButtonPressed(sender: AnyObject) {
        print("hourLongSessionDurationButtonPressed")
//        timerManager.startTimer()
        performSegueWithIdentifier("showMainAimSessionSegue", sender: self)
        if let delegate = self.delegate {
            delegate.getSessionDuration(sessionManager.aimHourLongSessionDuration)
        }
    }
    
    @IBAction func customizeSessionDurationButtonPressed(sender: AnyObject) {
        print("customizeSessionDurationButtonPressed")
        performSegueWithIdentifier("sessionDurationCustomizationSegue", sender: self)
    }
    
    @IBAction func startSessionWithoutTimeLimitationButtonPressed(sender: AnyObject) {
        print("startSessionWithoutTimeLimitationButtonPressed")
//        timerManager.startTimer()
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

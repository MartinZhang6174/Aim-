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
    @IBOutlet weak var aimLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (self.tabBarController?.tabBar.isHidden)! {
            aimLabel.isHidden = true
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.tabBarController?.tabBar.backgroundColor = UIColor.red()
    }

    @IBAction func defaultSessionDurationButtonPressed(_ sender: AnyObject) {
        print("defaultSessionDurationButtonPressed")
        performSegue(withIdentifier: "showMainAimSessionSegue", sender: self)
        if let delegate = self.delegate {
            delegate.getSessionDuration(sessionManager.aimDefaultSessionDuration)
        }
        
    }
    
    @IBAction func hourLongSessionDurationButtonPressed(_ sender: AnyObject) {
        print("hourLongSessionDurationButtonPressed")
//        timerManager.startTimer()
        performSegue(withIdentifier: "showMainAimSessionSegue", sender: self)
        if let delegate = self.delegate {
            delegate.getSessionDuration(sessionManager.aimHourLongSessionDuration)
        }
    }
    
    @IBAction func customizeSessionDurationButtonPressed(_ sender: AnyObject) {
        print("customizeSessionDurationButtonPressed")
        performSegue(withIdentifier: "sessionDurationCustomizationSegue", sender: self)
    }
    
    @IBAction func startSessionWithoutTimeLimitationButtonPressed(_ sender: AnyObject) {
        print("startSessionWithoutTimeLimitationButtonPressed")
//        timerManager.startTimer()
        performSegue(withIdentifier: "showMainAimSessionSegue", sender: self)
        if let delegate = self.delegate {
            delegate.getSessionDurationForSessionWithoutDurationLimits()
        }
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMainAimSessionSegue" {
            let mainSessionViewController = segue.destination as? SessionMainViewController
            
            if let sessionVC = mainSessionViewController {
                self.delegate = sessionVC
            }
        }
    }

}

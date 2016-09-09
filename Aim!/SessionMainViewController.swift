//
//  SessionMainViewController.swift
//  Aim!
//
//  Created by Martin Zhang on 2016-08-22.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

import UIKit

class SessionMainViewController: UIViewController, AimSessionDurationInfoDelegate {
    
    @IBOutlet weak var aimSessionDurationInfoDisplayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func getSessionDuration(duration: Int) {
        aimSessionDurationInfoDisplayLabel.text = "\(duration)-Minute-Long Session In Progress!"
    }

    func getSessionDurationForSessionWithoutDurationLimits() {
        aimSessionDurationInfoDisplayLabel.text = "'Forever-long' Session In Progress!"
    }
    
    @IBAction func endAimSessionButtonPressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}

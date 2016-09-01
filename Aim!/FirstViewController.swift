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
        self.tabBarController?.tabBar.backgroundColor = UIColor.redColor()
    }

    @IBAction func defaultSessionDurationButtonPressed(sender: AnyObject) {
        print("defaultSessionDurationButtonPressed")
        performSegueWithIdentifier("showMainAimSessionSegue", sender: self)
        if let delegate = self.delegate {
            delegate.getSessionDuration(25)
        }
    }
    
    @IBAction func hourLongSessionDurationButtonPressed(sender: AnyObject) {
        print("hourLongSessionDurationButtonPressed")
        performSegueWithIdentifier("showMainAimSessionSegue", sender: self)
        if let delegate = self.delegate {
            delegate.getSessionDuration(60)
        }
    }
    
    @IBAction func customizeSessionDurationButtonPressed(sender: AnyObject) {
        print("customizeSessionDurationButtonPressed")
//        performSegueWithIdentifier("showMainAimSessionSegue", sender: self)
        
    }
    
    @IBAction func startSessionWithoutTimeLimitationButtonPressed(sender: AnyObject) {
        print("startSessionWithoutTimeLimitationButtonPressed")
        performSegueWithIdentifier("showMainAimSessionSegue", sender: self)
        if let delegate = self.delegate {
            delegate.getSessionDuration(14114624)
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

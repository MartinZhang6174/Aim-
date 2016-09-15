//
//  SessionDurationCustomizationViewController.swift
//  Aim!
//
//  Created by Martin Zhang on 2016-09-10.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

import UIKit

class SessionDurationCustomizationViewController: UIViewController {
    
    @IBOutlet weak var startCustomizedSessionButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var customDurationLabel: UILabel!
    private var focusGuide: UIFocusGuide!
    private var focusGuide1: UIFocusGuide!
    
    var delegate: AimSessionDurationInfoDelegate?
    
    var customDuration: NSTimeInterval = 300
    
    override func viewDidLoad() {
        super.viewDidLoad()

        focusGuide = UIFocusGuide()
        focusGuide1 = UIFocusGuide()
        view.addLayoutGuide(focusGuide)
        view.addLayoutGuide(focusGuide1)
        
        // Setting up focusGuide constraints:
        focusGuide.leftAnchor.constraintEqualToAnchor(self.plusButton.leftAnchor).active = true
        focusGuide.topAnchor.constraintEqualToAnchor(self.startCustomizedSessionButton.topAnchor).active = true
        // Size anchors
        focusGuide.widthAnchor.constraintEqualToAnchor(self.plusButton.widthAnchor, multiplier: 1).active = true
        focusGuide.heightAnchor.constraintEqualToAnchor(self.startCustomizedSessionButton.heightAnchor, multiplier: 1).active = true
        
        // Setting up focusGuide1 constarints:
        focusGuide1.leftAnchor.constraintEqualToAnchor(self.minusButton.leftAnchor).active = true
        focusGuide1.topAnchor.constraintEqualToAnchor(self.startCustomizedSessionButton.topAnchor).active = true
        // Size anchors for layout guide 01
        focusGuide1.widthAnchor.constraintEqualToAnchor(self.minusButton.widthAnchor, multiplier: 1).active = true
        focusGuide1.heightAnchor.constraintEqualToAnchor(self.startCustomizedSessionButton.heightAnchor, multiplier: 1).active = true
        
        updateTimerLabel(customDuration)
    }
    
    // MARK: UIFocusEnvironment
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocusInContext(context, withAnimationCoordinator: coordinator)
        
        guard let nextFocusedView = context.nextFocusedView else {
            return
        }
        
        switch nextFocusedView {
        case plusButton:
            focusGuide.preferredFocusedView = startCustomizedSessionButton
            
        case minusButton:
            focusGuide1.preferredFocusedView = startCustomizedSessionButton
            
        case startCustomizedSessionButton:
            focusGuide.preferredFocusedView = plusButton
            focusGuide1.preferredFocusedView = minusButton
            
        default:
            focusGuide.preferredFocusedView = nil
            focusGuide1.preferredFocusedView = nil
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func reduceSessionDurationButtonPressed(sender: AnyObject) {
        print("Minus")
        customDuration -= 1
        updateTimerLabel(customDuration)
    }

    @IBAction func addSessionDurationButtonPressed(sender: AnyObject) {
        print("Plus")
        customDuration += 1
        updateTimerLabel(customDuration)
    }
    
    @IBAction func startCustomizedSessionButtonPressed(sender: AnyObject) {
        performSegueWithIdentifier("startCustomizedSessionSegue", sender: self)
        if let delegate = self.delegate {
            print("Custom \(customDuration) long session started.")
            delegate.getSessionDuration(customDuration)
        }
    }
    
    // MARK: - General Functions
    func updateTimerLabel(timerSeconds: NSTimeInterval) {
        let timeString = Utility.convertSecondsToTimeString(timerSeconds)
        customDurationLabel.text = timeString
    }
    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "startCustomizedSessionSegue" {
            let mainSessionViewController = segue.destinationViewController as? SessionMainViewController
            
            if let sessionVC = mainSessionViewController {
                self.delegate = sessionVC
            }
        }
    }
    

}

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
    
    var sessionManager = SessionManager()
    var customDuration: TimeInterval = 0  // custom duration in seconds.
    
    override func viewDidLoad() {
        super.viewDidLoad()

//<<<<<<< HEAD
//        focusGuide = UIFocusGuide()
//        focusGuide1 = UIFocusGuide()
//        view.addLayoutGuide(focusGuide)
//        view.addLayoutGuide(focusGuide1)
//        
//        // Setting up focusGuide constraints:
//        focusGuide.leftAnchor.constraintEqualToAnchor(self.plusButton.leftAnchor).active = true
//        focusGuide.topAnchor.constraintEqualToAnchor(self.startCustomizedSessionButton.topAnchor).active = true
//        
//        // Size anchors:
//        focusGuide.widthAnchor.constraintEqualToAnchor(self.plusButton.widthAnchor, multiplier: 1).active = true
//        focusGuide.heightAnchor.constraintEqualToAnchor(self.startCustomizedSessionButton.heightAnchor, multiplier: 1).active = true
//        
//        // Setting up focusGuide1 constarints:
//        focusGuide1.leftAnchor.constraintEqualToAnchor(self.minusButton.leftAnchor).active = true
//        focusGuide1.topAnchor.constraintEqualToAnchor(self.startCustomizedSessionButton.topAnchor).active = true
//        
//        // Size anchors for layout guide 01
//        focusGuide1.widthAnchor.constraintEqualToAnchor(self.minusButton.widthAnchor, multiplier: 1).active = true
//        focusGuide1.heightAnchor.constraintEqualToAnchor(self.startCustomizedSessionButton.heightAnchor, multiplier: 1).active = true
//=======
        
        setUpFocusGuides()
        
        customDuration = sessionManager.aimCustomizableSessionDuration
        updateTimerLabel(customDuration)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UIFocusEnvironment
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        
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
    
    func setUpFocusGuides() {
        focusGuide = UIFocusGuide()
        focusGuide1 = UIFocusGuide()
        view.addLayoutGuide(focusGuide)
        view.addLayoutGuide(focusGuide1)
        
        // Setting up focusGuide constraints:
        focusGuide.leftAnchor.constraint(equalTo: self.plusButton.leftAnchor).isActive = true
        focusGuide.topAnchor.constraint(equalTo: self.startCustomizedSessionButton.topAnchor).isActive = true
        // Size anchors
        focusGuide.widthAnchor.constraint(equalTo: self.plusButton.widthAnchor, multiplier: 1).isActive = true
        focusGuide.heightAnchor.constraint(equalTo: self.startCustomizedSessionButton.heightAnchor, multiplier: 1).isActive = true
        
        // Setting up focusGuide1 constarints:
        focusGuide1.leftAnchor.constraint(equalTo: self.minusButton.leftAnchor).isActive = true
        focusGuide1.topAnchor.constraint(equalTo: self.startCustomizedSessionButton.topAnchor).isActive = true
        // Size anchors for layout guide 01
        focusGuide1.widthAnchor.constraint(equalTo: self.minusButton.widthAnchor, multiplier: 1).isActive = true
        focusGuide1.heightAnchor.constraint(equalTo: self.startCustomizedSessionButton.heightAnchor, multiplier: 1).isActive = true
    }
    
    // MARK: - Actions
    @IBAction func reduceSessionDurationButtonPressed(_ sender: AnyObject) {
        print("Minus")
        // add logic to increase the decremented value if user repeats this action after n amount of times within a specific time frame.
        customDuration -= 60
        updateTimerLabel(customDuration)
    }

    @IBAction func addSessionDurationButtonPressed(_ sender: AnyObject) {
        print("Plus")
        // add logic to increase the incremented value if user repeats this action after n amount of times within a specific time frame.
        customDuration += 60
        updateTimerLabel(customDuration)
    }
    
    @IBAction func startCustomizedSessionButtonPressed(_ sender: AnyObject) {
        performSegue(withIdentifier: "startCustomizedSessionSegue", sender: self)
        if let delegate = self.delegate {
            print("Custom \(customDuration) seconds long session started.")
            delegate.getSessionDuration(customDuration)
        }
    }
    
    // MARK: - General Functions
    func updateTimerLabel(_ timerSeconds: TimeInterval) {
        let timeString = Utility.convertSecondsToTimeString(timerSeconds)
        customDurationLabel.text = timeString
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "startCustomizedSessionSegue" {
            let mainSessionViewController = segue.destinationViewController as? SessionMainViewController
            
            if let sessionVC = mainSessionViewController {
                self.delegate = sessionVC
            }
        }
    }
}

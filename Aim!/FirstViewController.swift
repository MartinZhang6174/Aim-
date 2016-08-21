//
//  FirstViewController.swift
//  Aim!
//
//  Created by Martin Zhang on 2016-08-20.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    // Outlets from FirstViewController
    @IBOutlet weak var defaultSessionDurationButton: UIButton!
    @IBOutlet weak var hourLongSessionDurationButton: UIButton!
    @IBOutlet weak var customizeSessionDurationButton: UIButton!
    @IBOutlet weak var startSessionWithoutTimeLimitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        if let imageView = defaultSessionDurationButton.imageView {
//            imageView.adjustsImageWhenAncestorFocused = true
//        }
        defaultSessionDurationButton.clipsToBounds = false
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.backgroundColor = UIColor.redColor()
    }

    @IBAction func defaultSessionDurationButtonPressed(sender: AnyObject) {
        print("defaultSessionDurationButtonPressed")
    }
    
    @IBAction func hourLongSessionDurationButtonPressed(sender: AnyObject) {
        print("hourLongSessionDurationButtonPressed")
    }

    @IBAction func customizeSessionDurationButtonPressed(sender: AnyObject) {
        print("customizeSessionDurationButtonPressed")
    }
    
    @IBAction func startSessionWithoutTimeLimitationButtonPressed(sender: AnyObject) {
        print("startSessionWithoutTimeLimitationButtonPressed")
    }

}

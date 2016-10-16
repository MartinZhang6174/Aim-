//
//  AimSessionDurationInfoDelegate.swift
//  Aim!
//
//  Created by Martin Zhang on 2016-08-22.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

import Foundation

protocol AimSessionDurationInfoDelegate {
    func getSessionDuration(_ durationInSeconds: TimeInterval)
    func getSessionDurationForSessionWithoutDurationLimits()
}

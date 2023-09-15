//
//  UserClass.swift
//  vR2 VPN
//
//  Created by VAIF on 9/14/23.
//  Copyright © 2023 VAIF CORP. All rights reserved.
//

import Foundation

class UserClass: Codable {
    let id: String
    let email: String?
    let ethAddress: String?
    let isActive: Bool
    let isSuspended: Bool
    let securityLogs: [SecurityLogClass]
    let plans: [PlanClass]
    let accountActivities: [AccountActivityClass]
    
    init(id: String, email: String?, ethAddress: String?, isActive: Bool, isSuspended: Bool, securityLogs: [SecurityLogClass], plans: [PlanClass], accountActivities: [AccountActivityClass]) {
        self.id = id
        self.email = email
        self.ethAddress = ethAddress
        self.isActive = isActive
        self.isSuspended = isSuspended
        self.securityLogs = securityLogs
        self.plans = plans
        self.accountActivities = accountActivities
    }
}

class SecurityLogClass: Codable {
    let time: Date
    let event: String
    let appVersion: String
    let ip: String
    let location: String
    let isp: String
    let device: String
    let protection: Bool
    
    init(time: Date, event: String, appVersion: String, ip: String, location: String, isp: String, device: String, protection: Bool) {
        self.time = time
        self.event = event
        self.appVersion = appVersion
        self.ip = ip
        self.location = location
        self.isp = isp
        self.device = device
        self.protection = protection
    }
}

class PlanClass: Codable {
    let planId: String
    let startDate: Date
    let endDate: Date
    let isActive: Bool
    
    init(planId: String, startDate: Date, endDate: Date, isActive: Bool) {
        self.planId = planId
        self.startDate = startDate
        self.endDate = endDate
        self.isActive = isActive
    }
}

class AccountActivityClass: Codable {
    let activityType: String
    
    init(activityType: String) {
        self.activityType = activityType
    }
}

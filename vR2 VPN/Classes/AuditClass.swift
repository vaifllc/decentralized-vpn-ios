//
//  AuditClass.swift
//  vR2 VPN
//
//  Created by VAIF on 9/14/23.
//  Copyright © 2023 VAIF CORP. All rights reserved.
//

import Foundation

/// Represents an audit log for tracking actions taken by users.
class AuditClass: Codable {
    var action: ActionType  // Action that triggered the audit (e.g., Login, Logout, etc.)
    var userId: String      // Unique ID for the user who triggered the action
    var tenantId: String    // Unique ID for the tenant (useful in multi-tenant systems)
    var ipAddress: String   // IP address from which the action was triggered
    var userAgent: String   // User agent string of the device used for the action
    var date: Date          // Date and time when the action was triggered
    
    /// Enum for the types of actions that can trigger an audit.
    enum ActionType: String, Codable {
        case LOGIN
        case LOGOUT
        case payment
        case subscriptionChange
        case UPDATE_PROFILE
        case PASSWORD_RESET
        // Add more actions as needed
    }
    
    // Initialization
    init(action: ActionType, userId: String, tenantId: String, ipAddress: String, userAgent: String, date: Date) {
        self.action = action
        self.userId = userId
        self.tenantId = tenantId
        self.ipAddress = ipAddress
        self.userAgent = userAgent
        self.date = date
    }
}

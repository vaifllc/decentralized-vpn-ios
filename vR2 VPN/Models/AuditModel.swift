//
//  AuditModel.swift
//  vR2 VPN
//
//  Created by VAIF on 9/11/23.
//

import Foundation

/// Represents an audit log for tracking actions taken by users.
struct Audit: Codable {
    let action: ActionType  // Action that triggered the audit (e.g., Login, Logout, etc.)
    let userId: String      // Unique ID for the user who triggered the action
    let tenantId: String    // Unique ID for the tenant (useful in multi-tenant systems)
    let ipAddress: String   // IP address from which the action was triggered
    let userAgent: String   // User agent string of the device used for the action
    let date: Date          // Date and time when the action was triggered
    
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
}

//
//  SessionClass.swift
//  vR2 VPN
//
//  Created by VAIF on 9/14/23.
//  Copyright © 2023 VAIF CORP. All rights reserved.
//

import Foundation

/// Represents a user session in the VPN service.
class SessionClass: Codable {
    var userId: String      // ID of the user who owns the session
    var app: AppType        // Type of app used for the session (iOS, Android, Web)
    var date: Date          // Date when the session was started
    var expires: Date       // Expiration date of the session
    var action: SessionAction // Action related to the session (Current, Ended)
    var ipAddress: String   // IP address used in the session
    var userAgent: String   // User agent string for the session
    
    /// Initialization
    init(userId: String, app: AppType, date: Date, expires: Date, action: SessionAction, ipAddress: String, userAgent: String) {
        self.userId = userId
        self.app = app
        self.date = date
        self.expires = expires
        self.action = action
        self.ipAddress = ipAddress
        self.userAgent = userAgent
    }
    
    /// Enum for different types of apps.
    enum AppType: String, Codable {
        case iOS, Android, Web
        // Add more types as needed
    }
    
    /// Enum for different types of session actions.
    enum SessionAction: String, Codable {
        case currentSession = "Current Session"
        case endedSession = "Ended Session"
        // Add more actions as needed
    }
}


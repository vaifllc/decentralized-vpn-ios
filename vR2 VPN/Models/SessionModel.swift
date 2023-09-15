//
//  SessionModel.swift
//  vR2 VPN
//
//  Created by VAIF on 9/11/23.
//  Copyright © 2023 VAIF CORP. All rights reserved.
//

import Foundation

/// Represents a user session in the VPN service.
struct Session: Codable {
    let userId: String      // ID of the user who owns the session
    let app: AppType        // Type of app used for the session (iOS, Android, Web)
    let date: Date          // Date when the session was started
    let expires: Date       // Expiration date of the session
    let action: SessionAction // Action related to the session (Current, Ended)
    let ipAddress: String   // IP address used in the session
    let userAgent: String   // User agent string for the session
    
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

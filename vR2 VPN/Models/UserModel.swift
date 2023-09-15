//
//  UserModel.swift
//  vR2 VPN
//
//  Created by VAIF on 9/11/23.
//

import Foundation

/// Represents a User in the system.
struct User: Codable {
    let id: String          // Unique ID for the user
    let email: String?      // User's email address (Optional if using ETH-based login)
    let ethAddress: String? // Ethereum address (Optional if using email-based login)
    let isActive: Bool      // Account activation status
    let isSuspended: Bool   // Account suspension status
    let securityLogs: [SecurityLog]       // Security logs associated with the user
    let plans: [Plan]       // Subscription plans associated with the user
    let accountActivities: [AccountActivity] // Account activities for the user
}

/// Represents a security log event.
struct SecurityLog: Codable {
    let time: Date      // Time of the event
    let event: String   // Type of event (e.g., Login, Logout, etc.)
    let appVersion: String // App version during the event
    let ip: String      // IP address from where the event originated
    let location: String // Geographical location of the event
    let isp: String     // Internet Service Provider
    let device: String  // Device information
    let protection: Bool // Two-factor authentication or other protection enabled
}

/// Represents a subscription plan for a user.
struct Plan: Codable {
    let planId: String  // Unique ID for the subscription plan
    let startDate: Date // Plan's start date
    let endDate: Date   // Plan's end date
    let isActive: Bool  // Plan activation status
}

/// Represents an account activity type.
struct AccountActivity: Codable {
    let activityType: String // Type of activity (e.g., Login, Payment, etc.)
}

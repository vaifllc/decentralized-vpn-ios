//
//  SubscriptionModel.swift
//  vR2 VPN
//
//  Created by VAIF on 9/11/23.
//  Copyright © 2023 VAIF CORP. All rights reserved.
//

import Foundation

/// Represents a user's subscription to the VPN service.
struct Subscription: Codable {
    let id: String           // Unique ID for the subscription
    let userId: String       // ID of the user who owns the subscription
    let planType: String     // Type of subscription plan (e.g., "Premium", "Family")
    let familyMembers: Int   // Number of family members included, if applicable
    let businessMembers: Int // Number of business members included, if applicable
    let startDate: Date      // Start date of the subscription
    let endDate: Date        // End date of the subscription
    let autoRenew: Bool      // Whether the subscription will auto-renew
    let isActive: Bool       // Whether the subscription is currently active
    let paymentId: String    // ID of the payment associated with the subscription
    let createdAt: Date      // Subscription creation date
    let updatedAt: Date      // Last updated date
    
    /// Custom keys for serialization/deserialization.
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userId
        case planType
        case familyMembers
        case businessMembers
        case startDate
        case endDate
        case autoRenew
        case isActive
        case paymentId
        case createdAt
        case updatedAt
    }
}

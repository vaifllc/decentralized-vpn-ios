//
//  SubscriptionClass.swift
//  vR2 VPN
//
//  Created by VAIF on 9/14/23.
//  Copyright © 2023 VAIF CORP. All rights reserved.
//

import Foundation

/// Represents a user's subscription to the VPN service.
class SubscriptionClass: Codable {
    var id: String           // Unique ID for the subscription
    var userId: String       // ID of the user who owns the subscription
    var planType: String     // Type of subscription plan (e.g., "Premium", "Family")
    var familyMembers: Int   // Number of family members included, if applicable
    var businessMembers: Int // Number of business members included, if applicable
    var startDate: Date      // Start date of the subscription
    var endDate: Date        // End date of the subscription
    var autoRenew: Bool      // Whether the subscription will auto-renew
    var isActive: Bool       // Whether the subscription is currently active
    var paymentId: String    // ID of the payment associated with the subscription
    var createdAt: Date      // Subscription creation date
    var updatedAt: Date      // Last updated date
    
    /// Initialization
    init(id: String, userId: String, planType: String, familyMembers: Int, businessMembers: Int, startDate: Date, endDate: Date, autoRenew: Bool, isActive: Bool, paymentId: String, createdAt: Date, updatedAt: Date) {
        self.id = id
        self.userId = userId
        self.planType = planType
        self.familyMembers = familyMembers
        self.businessMembers = businessMembers
        self.startDate = startDate
        self.endDate = endDate
        self.autoRenew = autoRenew
        self.isActive = isActive
        self.paymentId = paymentId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}


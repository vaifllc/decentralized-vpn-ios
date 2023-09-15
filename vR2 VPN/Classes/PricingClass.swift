//
//  PricingClass.swift
//  vR2 VPN
//
//  Created by VAIF on 9/14/23.
//  Copyright © 2023 VAIF CORP. All rights reserved.
//

import Foundation

/// Represents a pricing plan for the VPN service.
class PricingClass: Codable {
    var id: String            // Unique ID for the pricing plan
    var planName: String      // Name of the pricing plan (e.g., "Premium", "Basic")
    var monthlyPrice: Double  // Monthly price for the plan
    var yearlyPrice: Double   // Yearly price for the plan
    var twoYearlyPrice: Double // Two-yearly price for the plan
    var features: [String]    // Features included in the plan
    
    /// Initialization
    init(id: String, planName: String, monthlyPrice: Double, yearlyPrice: Double, twoYearlyPrice: Double, features: [String]) {
        self.id = id
        self.planName = planName
        self.monthlyPrice = monthlyPrice
        self.yearlyPrice = yearlyPrice
        self.twoYearlyPrice = twoYearlyPrice
        self.features = features
    }
    
    /// Custom keys for serialization/deserialization.
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case planName
        case monthlyPrice
        case yearlyPrice
        case twoYearlyPrice
        case features
    }
}


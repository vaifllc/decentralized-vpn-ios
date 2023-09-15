//
//  PricingModel.swift
//  vR2 VPN
//
//  Created by VAIF on 9/11/23.
//  Copyright © 2023 VAIF CORP. All rights reserved.
//

import Foundation

/// Represents a pricing plan for the VPN service.
struct Pricing: Codable {
    let id: String            // Unique ID for the pricing plan
    let planName: String      // Name of the pricing plan (e.g., "Premium", "Basic")
    let monthlyPrice: Double  // Monthly price for the plan
    let yearlyPrice: Double   // Yearly price for the plan
    let twoYearlyPrice: Double // Two-yearly price for the plan
    let features: [String]    // Features included in the plan
    
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

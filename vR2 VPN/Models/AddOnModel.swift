//
//  AddOnModel.swift
//  vR2 VPN
//
//  Created by VAIF on 9/11/23.
//

import Foundation

/// Represents an Add-On that can be purchased by a user.
struct AddOn: Codable {
    let addOnId: String  // Unique ID for the add-on
    let name: String     // Name of the add-on
    let description: String // Description of what the add-on provides
    let price: Double    // Price of the add-on
    let currency: String // Currency in which the price is denominated
    
    /// Enum for currency types (USD, EUR, etc.)
    enum Currency: String, Codable {
        case USD
        case EUR
        // Add more currencies as needed
    }
}

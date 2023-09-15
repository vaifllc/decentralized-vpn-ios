//
//  AddOnClass.swift
//  vR2 VPN
//
//  Created by VAIF on 9/14/23.
//  Copyright © 2023 VAIF CORP. All rights reserved.
//

import Foundation

/// Represents an Add-On that can be purchased by a user.
class AddOnClass: Codable {
    var addOnId: String  // Unique ID for the add-on
    var name: String     // Name of the add-on
    var description: String // Description of what the add-on provides
    var price: Double    // Price of the add-on
    var currency: String // Currency in which the price is denominated
    
    /// Enum for currency types (USD, EUR, etc.)
    enum Currency: String, Codable {
        case USD
        case EUR
        // Add more currencies as needed
    }
    
    // Initialization
    init(addOnId: String, name: String, description: String, price: Double, currency: String) {
        self.addOnId = addOnId
        self.name = name
        self.description = description
        self.price = price
        self.currency = currency
    }
}

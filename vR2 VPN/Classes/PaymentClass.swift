//
//  PaymentClass.swift
//  vR2 VPN
//
//  Created by VAIF on 9/14/23.
//  Copyright © 2023 VAIF CORP. All rights reserved.
//

import Foundation

/// Represents a payment made by a user.
class PaymentClass: Codable {
    var id: String?                  // Unique ID for the payment
    var userId: String               // ID of the user who made the payment
    var transactionId: String        // Unique transaction ID
    var amount: Double               // Amount paid
    var currency: String             // Currency in which the payment was made
    var paymentMethod: PaymentMethod // Method used for payment
    var status: PaymentStatus        // Status of the payment
    var createdAt: Date?             // Payment creation date
    var updatedAt: Date?             // Last updated date
    
    /// Initialization
    init(id: String?, userId: String, transactionId: String, amount: Double, currency: String, paymentMethod: PaymentMethod, status: PaymentStatus, createdAt: Date?, updatedAt: Date?) {
        self.id = id
        self.userId = userId
        self.transactionId = transactionId
        self.amount = amount
        self.currency = currency
        self.paymentMethod = paymentMethod
        self.status = status
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
    
    /// Enum for different types of payment methods.
    enum PaymentMethod: String, Codable {
        case CreditCard
        case PayPal
        case Crypto
        // Add more methods as needed
    }
    
    /// Enum for different payment statuses.
    enum PaymentStatus: String, Codable {
        case Completed
        case Pending
        case Failed
        // Add more statuses as needed
    }
}


//
//  InvoiceClass.swift
//  vR2 VPN
//
//  Created by VAIF on 9/14/23.
//  Copyright © 2023 VAIF CORP. All rights reserved.
//

import Foundation

/// Represents an invoice for a user's subscription or other purchases.
class InvoiceClass: Codable {
    var invoiceId: String?        // Unique ID for the invoice
    var userId: String?           // ID of the user who owns the invoice
    var tenantId: String?         // ID of the tenant, if applicable
    var dueDate: Date?            // Due date for the invoice
    var paidDate: Date?           // Payment date, if applicable
    var status: InvoiceStatusClass?    // Status of the invoice
    var amount: Double?           // Total amount due
    var paymentMethod: String?    // Method of payment (e.g., Credit Card, PayPal)
    var paymentDetails: String?   // Additional payment details
    var currency: String?         // Currency for the amount
    var createdAt: Date?          // Invoice creation date
    var updatedAt: Date?          // Last updated date
    var items: [ItemClass]?       // List of items on the invoice
    
    /// Enum for invoice statuses (Unpaid, Paid, Overdue, etc.)
    enum InvoiceStatusClass: String, Codable {
        case Unpaid
        case Paid
        case Overdue
        // Add more statuses as needed
    }
    
    /// Initialization for `InvoiceClass`.
    init(invoiceId: String?, userId: String?, tenantId: String?, dueDate: Date?, paidDate: Date?, status: InvoiceStatusClass?, amount: Double?, paymentMethod: String?, paymentDetails: String?, currency: String?, createdAt: Date?, updatedAt: Date?, items: [ItemClass]?) {
        self.invoiceId = invoiceId
        self.userId = userId
        self.tenantId = tenantId
        self.dueDate = dueDate
        self.paidDate = paidDate
        self.status = status
        self.amount = amount
        self.paymentMethod = paymentMethod
        self.paymentDetails = paymentDetails
        self.currency = currency
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.items = items
    }
}

/// Represents an individual item on the invoice.
class ItemClass: Codable {
    var description: String?  // Description of the item
    var unitCost: Double?     // Cost per unit of the item
    var quantity: Double?     // Quantity of the item
    
    /// Initialization for `ItemClass`.
    init(description: String?, unitCost: Double?, quantity: Double?) {
        self.description = description
        self.unitCost = unitCost
        self.quantity = quantity
    }
}


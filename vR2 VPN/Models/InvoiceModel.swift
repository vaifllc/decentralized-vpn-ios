//
//  InvoiceModel.swift
//  vR2 VPN
//
//  Created by VAIF on 9/11/23.
//  Copyright © 2023 VAIF CORP. All rights reserved.
//

import Foundation

/// Represents an invoice for a user's subscription or other purchases.
struct Invoice: Codable {
    let invoiceId: String?        // Unique ID for the invoice
    let userId: String?           // ID of the user who owns the invoice
    let tenantId: String?         // ID of the tenant, if applicable
    let dueDate: Date?            // Due date for the invoice
    let paidDate: Date?           // Payment date, if applicable
    let status: InvoiceStatus?    // Status of the invoice
    let amount: Double?           // Total amount due
    let paymentMethod: String?    // Method of payment (e.g., Credit Card, PayPal)
    let paymentDetails: String?   // Additional payment details
    let currency: String?         // Currency for the amount
    let createdAt: Date?          // Invoice creation date
    let updatedAt: Date?          // Last updated date
    
    /// Enum for invoice statuses (Unpaid, Paid, Overdue, etc.)
    enum InvoiceStatus: String, Codable {
        case Unpaid
        case Paid
        case Overdue
        // Add more statuses as needed
    }
    
    /// Represents an individual item on the invoice.
    struct Item: Codable {
        let description: String?  // Description of the item
        let unitCost: Double?     // Cost per unit of the item
        let quantity: Double?     // Quantity of the item
    }
    
    let items: [Item]?  // List of items on the invoice
}

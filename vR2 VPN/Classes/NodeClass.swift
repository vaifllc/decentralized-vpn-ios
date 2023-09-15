//
//  NodeClass.swift
//  vR2 VPN
//
//  Created by VAIF on 9/14/23.
//  Copyright © 2023 VAIF CORP. All rights reserved.
//

import Foundation

/// Represents a VPN node in the network.
class NodeClass: Codable {
    var id: String?              // Unique ID for the node
    var tenantId: String?        // ID of the tenant (useful in multi-tenant systems)
    var name: String             // Name of the node
    var type: NodeType           // Type of node (e.g., Entry, Exit)
    var ipAddress: String        // IP address of the node
    var port: Int                // Port number for the node
    var status: NodeStatus       // Status of the node (e.g., Active, Inactive)
    var createdAt: Date?         // Node creation date
    var updatedAt: Date?         // Last updated date
    var configDetails: [String: AnyCodable] // Additional configuration details
    var tags: [String]           // Tags for categorizing or describing the node
    
    /// Initialization
    init(id: String?, tenantId: String?, name: String, type: NodeType, ipAddress: String, port: Int, status: NodeStatus, createdAt: Date?, updatedAt: Date?, configDetails: [String: AnyCodable], tags: [String]) {
        self.id = id
        self.tenantId = tenantId
        self.name = name
        self.type = type
        self.ipAddress = ipAddress
        self.port = port
        self.status = status
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.configDetails = configDetails
        self.tags = tags
    }
    
    /// Enum for different types of nodes.
    enum NodeType: String, Codable {
        case Entry
        case Exit
        case Relay
        // Add more types as needed
    }
    
    /// Enum for node statuses.
    enum NodeStatus: String, Codable {
        case Active
        case Inactive
        case Maintenance
        // Add more statuses as needed
    }
}


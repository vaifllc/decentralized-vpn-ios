//
//  ServerClass.swift
//  vR2 VPN
//
//  Created by VAIF on 9/14/23.
//  Copyright © 2023 VAIF CORP. All rights reserved.
//

import Foundation

/// Represents a VPN server.
class ServerClass: Codable {
    var serverId: String    // Unique ID for the server
    var name: String        // Name of the server
    var location: String    // Geographical location of the server
    var capacity: Int       // Maximum capacity of the server
    var load: Int           // Current load on the server
    var status: ServerStatus // Status of the server (e.g., Online, Offline)
    var createdAt: Date     // Server creation date
    var updatedAt: Date?    // Last updated date, if applicable
    var tenantId: String    // Tenant ID, useful in multi-tenant systems
    
    /// Initialization
    init(serverId: String, name: String, location: String, capacity: Int, load: Int, status: ServerStatus, createdAt: Date, updatedAt: Date?, tenantId: String) {
        self.serverId = serverId
        self.name = name
        self.location = location
        self.capacity = capacity
        self.load = load
        self.status = status
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.tenantId = tenantId
    }
    
    /// Enum for different server statuses.
    enum ServerStatus: String, Codable {
        case online
        case offline
        case maintenance
        // Add more statuses as needed
    }
}


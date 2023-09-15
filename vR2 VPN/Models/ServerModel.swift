//
//  ServerModel.swift
//  vR2 VPN
//
//  Created by VAIF on 9/11/23.
//  Copyright © 2023 VAIF CORP. All rights reserved.
//

import Foundation

/// Represents a VPN server.
struct Server: Codable {
    let serverId: String    // Unique ID for the server
    let name: String        // Name of the server
    let location: String    // Geographical location of the server
    let capacity: Int       // Maximum capacity of the server
    let load: Int           // Current load on the server
    let status: ServerStatus // Status of the server (e.g., Online, Offline)
    let createdAt: Date     // Server creation date
    let updatedAt: Date?    // Last updated date, if applicable
    let tenantId: String    // Tenant ID, useful in multi-tenant systems
    
    /// Enum for different server statuses.
    enum ServerStatus: String, Codable {
        case online
        case offline
        case maintenance
        // Add more statuses as needed
    }
}

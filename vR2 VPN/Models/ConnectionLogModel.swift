//
//  ConnectionLogModel.swift
//  vR2 VPN
//
//  Created by VAIF on 9/11/23.
//  Copyright © 2023 VAIF CORP. All rights reserved.
//

import Foundation

/// Represents a log of a VPN connection session.
struct ConnectionLog: Codable {
    let id: String           // Unique ID for the log entry
    let user: String         // ID of the user who initiated the connection
    let server: String       // ID of the server to which the user connected
    let startTime: Date      // Time when the connection started
    let endTime: Date?       // Time when the connection ended (Optional)
    let dataUsage: Int?      // Amount of data used during the connection (Optional)
    
    /// Custom keys for serialization/deserialization.
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case user
        case server
        case startTime
        case endTime
        case dataUsage
    }
}

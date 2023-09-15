//
//  ConnectionLogClass.swift
//  vR2 VPN
//
//  Created by VAIF on 9/14/23.
//  Copyright © 2023 VAIF CORP. All rights reserved.
//

import Foundation

class ConnectionLogClass: Codable {
    var id: String           // Unique ID for the log entry
    var user: String         // ID of the user who initiated the connection
    var server: String       // ID of the server to which the user connected
    var startTime: Date      // Time when the connection started
    var endTime: Date?       // Time when the connection ended (Optional)
    var dataUsage: Int?      // Amount of data used during the connection (Optional)
    
    /// Custom keys for serialization/deserialization.
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case user
        case server
        case startTime
        case endTime
        case dataUsage
    }
    
    init(id: String, user: String, server: String, startTime: Date, endTime: Date?, dataUsage: Int?) {
        self.id = id
        self.user = user
        self.server = server
        self.startTime = startTime
        self.endTime = endTime
        self.dataUsage = dataUsage
    }
}


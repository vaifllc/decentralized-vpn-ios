//
//  EventLogModel.swift
//  vR2 VPN
//
//  Created by VAIF on 9/11/23.
//  Copyright © 2023 VAIF CORP. All rights reserved.
//

import Foundation

/// Enum to define different types of events that can be logged.
enum EventType: String, Codable {
    case userUpdate = "UserUpdate"
    case userUpdateError = "UserUpdateError"
    case userLogin = "UserLogin"
    case userLogout = "UserLogout"
    // Add more event types here as needed
}

/// Typealias for a dictionary holding event details.
typealias DetailsDictionary = [String: AnyCodable]

/// Represents an event log for tracking user actions and system events.
struct EventLog: Codable {
    
    let userId: String      // The ID of the user associated with the event
    let eventType: EventType // The type of event being logged
    let details: DetailsDictionary // Additional details about the event
    
    /// Custom initializer for `EventLog`.
    init(userId: String, eventType: EventType, details: DetailsDictionary) {
        self.userId = userId
        self.eventType = eventType
        self.details = details
    }
    
    /// Manually encode the `EventLog` struct.
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(userId, forKey: .userId)
        try container.encode(eventType, forKey: .eventType)
        try container.encode(details, forKey: .details)
    }
    
    /// Manually decode the `EventLog` struct.
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userId = try values.decode(String.self, forKey: .userId)
        eventType = try values.decode(EventType.self, forKey: .eventType)
        details = try values.decode(DetailsDictionary.self, forKey: .details)
    }
    
    /// Define the coding keys for custom encoding and decoding.
    enum CodingKeys: String, CodingKey {
        case userId
        case eventType
        case details
    }
}

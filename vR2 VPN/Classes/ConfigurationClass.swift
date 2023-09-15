//
//  ConfigurationClass.swift
//  vR2 VPN
//
//  Created by VAIF on 9/14/23.
//  Copyright © 2023 VAIF CORP. All rights reserved.
//

import Foundation

class ConfigurationClass: Codable {
    var _id: String               // Unique ID for the configuration
    var serverId: String          // ID of the server used in this configuration
    var vpnType: VPNType          // Type of VPN (e.g., OpenVPN, WireGuard, etc.)
    var configDetails: [String: AnyCodable] // Additional configuration details
    var createdAt: String         // Creation date of this configuration
    var updatedAt: String         // Last updated date of this configuration
    
    /// Enum for the different types of VPNs supported.
    enum VPNType: String, Codable {
        case OpenVPN
        case WireGuard
        case IKEv2
        case ZeroTier
        // Add more VPN types as needed
    }
    
    init(_id: String, serverId: String, vpnType: VPNType, configDetails: [String: AnyCodable], createdAt: String, updatedAt: String) {
        self._id = _id
        self.serverId = serverId
        self.vpnType = vpnType
        self.configDetails = configDetails
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

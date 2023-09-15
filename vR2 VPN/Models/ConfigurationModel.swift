//
//  ConfigurationModel.swift
//  vR2 VPN
//
//  Created by VAIF on 9/11/23.
//

import Foundation

/// Represents the configuration settings for a VPN connection.
struct Configuration: Codable {
    let _id: String               // Unique ID for the configuration
    let serverId: String          // ID of the server used in this configuration
    let vpnType: VPNType          // Type of VPN (e.g., OpenVPN, WireGuard, etc.)
    let configDetails: [String: AnyCodable] // Additional configuration details
    let createdAt: String         // Creation date of this configuration
    let updatedAt: String         // Last updated date of this configuration
    
    /// Enum for the different types of VPNs supported.
    enum VPNType: String, Codable {
        case OpenVPN
        case WireGuard
        case IKEv2
        case ZeroTier
        // Add more VPN types as needed
    }
}

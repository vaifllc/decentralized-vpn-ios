//
//  BlacklistedTokenModel.swift
//  vR2 VPN
//
//  Created by VAIF on 9/11/23.
//

import Foundation

/// Represents a JWT token that has been blacklisted.
struct BlacklistedToken: Codable {
    let token: String  // The JWT token that is blacklisted
    let userId: String // The user ID associated with this token
    let expires: Int   // The expiration time of this token in seconds since the Unix epoch
}

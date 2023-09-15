//
//  BlacklistedTokenClass.swift
//  vR2 VPN
//
//  Created by VAIF on 9/14/23.
//  Copyright © 2023 VAIF CORP. All rights reserved.
//

import Foundation

/// Represents a JWT token that has been blacklisted.
class BlacklistedTokenClass: Codable {
    var token: String  // The JWT token that is blacklisted
    var userId: String // The user ID associated with this token
    var expires: Int   // The expiration time of this token in seconds since the Unix epoch
    
    // Initialization
    init(token: String, userId: String, expires: Int) {
        self.token = token
        self.userId = userId
        self.expires = expires
    }
}

//
//  Constants.swift
//  vR2 VPN
//
//  Created by VAIF on 9/14/23.
//  Copyright © 2023 VAIF CORP. All rights reserved.
//

import Foundation

struct Constants {
    // API
    static let apiBaseURL = "https://your-api-base-url.com/api"
    static let userTokenKey = "userToken"
    static let lastSyncDateKey = "LastSyncDate"
    
    // UI
    static let animationDuration = 0.3
    static let maxPasswordLength = 16
    
    // Notifications
    static let userDidLoginNotification = Notification.Name("userDidLogin")
    static let userDidLogoutNotification = Notification.Name("userDidLogout")
    
    // Other
    // ...
    // API keys
    static let apiKey = "YOUR_API_KEY_HERE"
    
}



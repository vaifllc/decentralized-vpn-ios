//
//  StatusClass.swift
//  vR2 VPN
//
//  Created by VAIF on 9/14/23.
//  Copyright © 2023 VAIF CORP. All rights reserved.
//

import Foundation

enum StatusCode: String {
    case success = "200"
    case clientError = "400"
    case unauthorized = "401"
    case notFound = "404"
    case serverError = "500"
}

enum SubStatusCode: String {
    case validationError = "400.1"
    case unauthorizedAccess = "401.1"
}

struct StatusClass {
    let code: StatusCode
    let subCode: SubStatusCode?
    let message: String
    let userFriendlyMessage: String
    let i18nKey: String?
    
    init(code: StatusCode, subCode: SubStatusCode? = nil, message: String, userFriendlyMessage: String, i18nKey: String? = nil) {
        self.code = code
        self.subCode = subCode
        self.message = message
        self.userFriendlyMessage = userFriendlyMessage
        self.i18nKey = i18nKey
    }
}



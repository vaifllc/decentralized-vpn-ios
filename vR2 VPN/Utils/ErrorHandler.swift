//
//  ErrorHandler.swift
//  vR2 VPN
//
//  Created by VAIF on 9/14/23.
//  Copyright © 2023 VAIF CORP. All rights reserved.
//

import Foundation
import UIKit


class ErrorHandler {
    
    static let shared = ErrorHandler()
    
    private init() {}
    
    func handle(_ error: Error, on viewController: UIViewController) {
        var message = "An unknown error occurred."
        
        if let apiError = error as? APIClient.APIError {
            switch apiError {
            case .serverError:
                message = "Server is not responding. Please try again later."
            case .parsingError:
                message = "Failed to read server response. Please try again."
            case .networkError:
                message = "No internet connection. Please check your settings."
            case .unauthorized:
                message = "You are not authorized for this action."
            }
        }
        
        // Display an alert with the message
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        viewController.present(alert, animated: true, completion: nil)
    }
}

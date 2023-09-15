//
//  ApiClient.swift
//  vR2 VPN
//
//  Created by VAIF on 9/14/23.
//  Copyright © 2023 VAIF CORP. All rights reserved.
//

import Foundation
import KeychainSwift

class APIClient {
    
    static let shared = APIClient()
    
    private let baseURL = "https://your-api-base-url.com/api"
    private var lastRequestTime: Date?
    private let rateLimitInterval: TimeInterval = 60
    private let urlCache = URLCache(memoryCapacity: 500_000, diskCapacity: 5_000_000, diskPath: nil)
    
    private enum Endpoint: String {
        case login = "/users/login"
        case register = "/users/register"
        case profile = "/users/profile"
        case updateProfile = "/users/update"
        case enableTwoFactor = "/users/enableTwoFactor"
        case validateTwoFactorToken = "/users/validateTwoFactorToken"
        case logout = "/users/logout"
        case userDetails = "/users/details"
        case createSession = "/sessions/create"
        case getSessions = "/sessions"
        case revokeSession = "/sessions/revoke"
        case status = "/status"
        case refreshToken = "/refresh-token"
    }
    
    enum APIError: Error {
        case serverError
        case parsingError
        case networkError
        case unauthorized
    }

    private init() {}
    
    func storeTokenInKeychain(token: String) {
        // Using native iOS Keychain APIs or a library like KeychainSwift
         KeychainSwift().set(token, forKey: "userToken") // Uncomment if using KeychainSwift
        print("Token stored in keychain: \(token)")  // Mock implementation
    }

    private func canMakeRequest() -> Bool {
        guard let lastRequestTime = lastRequestTime else {
            return true
        }
        return Date().timeIntervalSince(lastRequestTime) > rateLimitInterval
    }

    // This function returns the last date the data was synced.
        // In a real-world application, this could be stored in UserDefaults or fetched from a database.
        func getLastSyncDate() -> Date? {
            // Replace with your actual logic to get the last sync date
            return UserDefaults.standard.object(forKey: "LastSyncDate") as? Date
        }
        
        // This function fetches data from the server.
        // Replace this mock function with your actual API call.
        func fetchDataFromServer(completion: @escaping (Result<Bool, Error>) -> Void) {
            // Mock API call logic
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                completion(.success(true))
            }
        }

        func syncDataIfNeeded() {
            let lastSyncDate = getLastSyncDate()
            let currentDate = Date()
            
            let needsSync: Bool
            if let lastSyncDate = lastSyncDate {
                // Check if it's been more than a day since the last sync
                let timeSinceLastSync = currentDate.timeIntervalSince(lastSyncDate)
                needsSync = timeSinceLastSync > (24 * 60 * 60)
            } else {
                // If there's no last sync date, sync is needed.
                needsSync = true
            }
            
            if needsSync {
                fetchDataFromServer { result in
                    switch result {
                    case .success:
                        print("Data successfully synced.")
                        // Update last sync date
                        UserDefaults.standard.set(currentDate, forKey: "LastSyncDate")
                    case .failure(let error):
                        print("Data sync failed with error: \(error)")
                    }
                }
            } else {
                print("Data is up to date. No sync needed.")
            }
        }
    
    func logEvent(event: String, parameters: [String: Any]?) {
        // Log event using an analytics library like Firebase Analytics
        // Analytics.logEvent(event, parameters: parameters) // Uncomment if using Firebase Analytics
        print("Logged event: \(event) with parameters: \(String(describing: parameters))")  // Mock implementation
    }
    
    func refreshToken(completion: @escaping (Result<String, Error>) -> Void) {
        let url = URL(string: "\(baseURL)\(Endpoint.refreshToken.rawValue)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIError.parsingError))
                return
            }
            
            do {
                let newToken = try JSONDecoder().decode(String.self, from: data)
                self.storeTokenInKeychain(token: newToken)
                completion(.success(newToken))
            } catch {
                completion(.failure(APIError.parsingError))
            }
        }
        
        task.resume()
    }
    
    private func makeRequest(_ request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        guard canMakeRequest() else {
            completion(.failure(APIError.serverError))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            self.lastRequestTime = Date()
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(APIError.serverError))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIError.parsingError))
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
    
    func login(user: UserClass, completion: @escaping (Result<UserClass, Error>) -> Void) {
        let url = URL(string: "\(baseURL)\(Endpoint.login.rawValue)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            let jsonData = try JSONEncoder().encode(user)
            request.httpBody = jsonData
        } catch {
            completion(.failure(APIError.parsingError))
            return
        }
        
        makeRequest(request) { result in
            switch result {
            case .success(let data):
                do {
                    let user = try JSONDecoder().decode(UserClass.self, from: data)
                    completion(.success(user))
                } catch {
                    completion(.failure(APIError.parsingError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func register(user: UserClass, completion: @escaping (Result<UserClass, Error>) -> Void) {
        let url = URL(string: "\(baseURL)\(Endpoint.register.rawValue)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            let jsonData = try JSONEncoder().encode(user)
            request.httpBody = jsonData
        } catch {
            completion(.failure(APIError.parsingError))
            return
        }
        
        makeRequest(request) { result in
            switch result {
            case .success(let data):
                do {
                    let user = try JSONDecoder().decode(UserClass.self, from: data)
                    completion(.success(user))
                } catch {
                    completion(.failure(APIError.parsingError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func updateProfile(user: UserClass, completion: @escaping (Result<UserClass, Error>) -> Void) {
        let url = URL(string: "\(baseURL)\(Endpoint.updateProfile.rawValue)")!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        do {
            let jsonData = try JSONEncoder().encode(user)
            request.httpBody = jsonData
        } catch {
            completion(.failure(APIError.parsingError))
            return
        }
        
        makeRequest(request) { result in
            switch result {
            case .success(let data):
                do {
                    let user = try JSONDecoder().decode(UserClass.self, from: data)
                    completion(.success(user))
                } catch {
                    completion(.failure(APIError.parsingError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func enableTwoFactor(completion: @escaping (Result<Bool, Error>) -> Void) {
        let url = URL(string: "\(baseURL)\(Endpoint.enableTwoFactor.rawValue)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        makeRequest(request) { result in
            switch result {
            case .success:
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func validateTwoFactorToken(token: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let url = URL(string: "\(baseURL)\(Endpoint.validateTwoFactorToken.rawValue)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        makeRequest(request) { result in
            switch result {
            case .success:
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func logout(completion: @escaping (Result<Bool, Error>) -> Void) {
        let url = URL(string: "\(baseURL)\(Endpoint.logout.rawValue)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        makeRequest(request) { result in
            switch result {
            case .success:
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getUserDetails(completion: @escaping (Result<UserClass, Error>) -> Void) {
        let url = URL(string: "\(baseURL)\(Endpoint.userDetails.rawValue)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        makeRequest(request) { result in
            switch result {
            case .success(let data):
                do {
                    let user = try JSONDecoder().decode(UserClass.self, from: data)
                    completion(.success(user))
                } catch {
                    completion(.failure(APIError.parsingError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func createSession(completion: @escaping (Result<SessionClass, Error>) -> Void) {
        let url = URL(string: "\(baseURL)\(Endpoint.createSession.rawValue)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        makeRequest(request) { result in
            switch result {
            case .success(let data):
                do {
                    let session = try JSONDecoder().decode(SessionClass.self, from: data)
                    completion(.success(session))
                } catch {
                    completion(.failure(APIError.parsingError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getSessions(completion: @escaping (Result<[SessionClass], Error>) -> Void) {
        let url = URL(string: "\(baseURL)\(Endpoint.getSessions.rawValue)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        makeRequest(request) { result in
            switch result {
            case .success(let data):
                do {
                    let sessions = try JSONDecoder().decode([SessionClass].self, from: data)
                    completion(.success(sessions))
                } catch {
                    completion(.failure(APIError.parsingError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func revokeSession(sessionId: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let url = URL(string: "\(baseURL)\(Endpoint.revokeSession.rawValue)")!
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        makeRequest(request) { result in
            switch result {
            case .success:
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
//    func getStatus(completion: @escaping (Result<StatusClass, Error>) -> Void) {
//        let url = URL(string: "\(baseURL)\(Endpoint.status.rawValue)")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//
//        makeRequest(request) { result in
//            switch result {
//            case .success(let data):
//                do {
//                    let status = try JSONDecoder().decode(StatusClass.self, from: data)
//                    completion(.success(status))
//                } catch {
//                    completion(.failure(APIError.parsingError))
//                }
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
}

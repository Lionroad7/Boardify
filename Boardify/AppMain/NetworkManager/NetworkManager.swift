//
//  NetworkManager.swift
//  Boardify
//
//  Created by islombek on 10/10/24.
//

import Foundation
import SwiftUI

// Define an enum for handling different types of errors
enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case decodingFailed
    case invalidResponse
}


class NetworkManager: ObservableObject {
    
    static let shared = NetworkManager()
    

    private let baseURL = "https://boardify-backend.onrender.com/"
    

    func getRequest<T: Decodable>(endpoint: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: baseURL + endpoint) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                DispatchQueue.main.async {
                    completion(.failure(.requestFailed))
                }
                return
            }
            
            guard let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                DispatchQueue.main.async {
                    completion(.failure(.invalidResponse))
                }
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(.decodingFailed))
                }
            }
        }.resume()
    }
    

    func postRequest<T: Decodable, U: Encodable>(endpoint: String, requestBody: U, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: baseURL + endpoint) else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONEncoder().encode(requestBody)
        } catch {
            completion(.failure(.decodingFailed))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                DispatchQueue.main.async {
                    completion(.failure(.requestFailed))
                }
                return
            }
            
            guard let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                DispatchQueue.main.async {
                    completion(.failure(.invalidResponse))
                }
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(.decodingFailed))
                }
            }
        }.resume()
    }
}


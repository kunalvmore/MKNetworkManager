//
//  NetworkManager.swift
//  MKNetworkManager
//
//  Created by Kunal More on 02/05/24.
//

import Foundation

public enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

public class NetworkManager<T: Codable> {
    
    public init() { }
    
    public func fetchData(from urlString: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching data: \(error)")
                completion(.failure(.noData))
                return
            }
            
            guard let responseData = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: responseData)
                completion(.success(decodedData))
            } catch {
                print("Error decoding data: \(error)")
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
    

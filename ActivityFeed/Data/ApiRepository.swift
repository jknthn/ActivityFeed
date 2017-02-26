//
//  ApiRepository.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 26/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

enum ApiError: Error {
    case unknown
    case network
    case parse
}

class ApiRepository: EntityGateway {
    
    // MARK: - EntityGateway
    
    func getActivities(for range: Range<Date>, completion: @escaping (Result<ActivitiesResponse, Error>) -> Void) {
        get(.activities(range: range)) { result in
            completion(result)
        }
    }
    
    // MARK: - Utility
    
    private func get<T: JsonParsable>(_ endpoint: ApiEndpoint, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: endpoint.url) { data, response, error in
            if let _ = error {
                completion(.error(ApiError.network))
            }
            DispatchQueue.main.async {
                do {
                    guard
                        let data = data,
                        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? JsonDictionary,
                        let object = T.fromJson(json: json)
                    else {
                            completion(.error(ApiError.parse))
                            return
                    }
                    completion(.success(object))
                } catch {
                    completion(.error(ApiError.parse))
                }
            }
        }.resume()
    }
    
}


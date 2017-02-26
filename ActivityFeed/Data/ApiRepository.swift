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
        
    }
    
    // MARK: - Utility
    
    
}


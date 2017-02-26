//
//  ApiEndpoint.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 26/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

enum ApiEndpoint {
    case activities(range: Range<Date>)
    
    static let apiUrl = URL(string: "http://qapital-ios-testtask.herokuapp.com")!
    
    var url: URL {
        switch self {
        case .activities(let range):
            let formatter = ISO8601DateFormatter()
            var components = URLComponents(url: ApiEndpoint.apiUrl, resolvingAgainstBaseURL: true)!
            components.path = "/activities"
            components.queryItems = [
                URLQueryItem(name: "from", value: formatter.string(from: range.lowerBound)),
                URLQueryItem(name: "to", value: formatter.string(from: range.lowerBound))
            ]
            return components.url!
        }
    }
}

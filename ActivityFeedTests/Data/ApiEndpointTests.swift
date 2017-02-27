//
//  ApiEndpointTests.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 26/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import XCTest
@testable import ActivityFeed

class ApiEndpointTests: XCTestCase {
    
    private let apiBaseUrlString = "http://qapital-ios-testtask.herokuapp.com"
    
    // MARK: - Tests
    
    func testActivitiesEndpoint() {
        let date = Date()
        let range = Range(uncheckedBounds: (lower: date, upper: date))
        let url = ApiEndpoint.activities(range: range).url
        let formattedDate = DateFormatter.api.string(from: date)
        let urlString = apiBaseUrlString + "/activities?from=\(formattedDate)&to=\(formattedDate)"
        XCTAssertEqual(url.absoluteString, urlString)
    }
}

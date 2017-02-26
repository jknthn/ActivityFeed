//
//  Date+SubtractTests.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 26/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import XCTest
@testable import ActivityFeed

class DateSubtractTests: XCTestCase {
    
    func testSubtractValid() {
        let date = Date()
        let dateInterval = date.substracting2Weeks()!.timeIntervalSince1970
        let otherInterval = date.addingTimeInterval(-60.0 * 60.0 * 24.0 * 14.0).timeIntervalSince1970
        XCTAssertEqual(dateInterval, otherInterval)
    }
    
}

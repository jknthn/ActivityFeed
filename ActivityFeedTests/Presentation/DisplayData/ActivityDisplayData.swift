//
//  ActivityDisplayData.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 24/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import XCTest
@testable import ActivityFeed

class ActivityDisplayDataTests: XCTestCase {
    
    var activityData: ActivityDisplayData!
    
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()
        activityData = ActivityDisplayData.main
    }
    
    override func tearDown() {
        activityData = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testInitializesWithActivity() {
        XCTAssertEqual(activityData, ActivityDisplayData(activity: Activity.main))
    }
    
    func testEqualsToSelf() {
        XCTAssertEqual(activityData, activityData)
    }
    
    func testNotEqualsToDifferent() {
        XCTAssertNotEqual(activityData, ActivityDisplayData.alt)
    }
    
}

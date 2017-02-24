//
//  ActivityTests.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 24/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import XCTest
@testable import ActivityFeed

class ActivityTests: XCTestCase {
    
    var activity: Activity!
    
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()
        activity = Activity.main
    }
    
    override func tearDown() {
        activity = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testEqualsToSelf() {
        XCTAssertEqual(activity, activity)
    }
    
    func testNotEqualsIfDifferentId() {
        let otherActivity = Activity(
            id: TestData.altId,
            message: TestData.mainMessage,
            amount: TestData.mainAmount,
            userId: TestData.mainUserId,
            timestamp: TestData.mainTimestamp
        )
        XCTAssertNotEqual(activity, otherActivity)
    }
    
    func testNotEqualsIfDifferentMessage() {
        let otherActivity = Activity(
            id: TestData.mainId,
            message: TestData.altMessage,
            amount: TestData.mainAmount,
            userId: TestData.mainUserId,
            timestamp: TestData.mainTimestamp
        )
        XCTAssertNotEqual(activity, otherActivity)
    }
    
    func testNotEqualsIfDifferentAmount() {
        let otherActivity = Activity(
            id: TestData.mainId,
            message: TestData.mainMessage,
            amount: TestData.altAmount,
            userId: TestData.mainUserId,
            timestamp: TestData.mainTimestamp
        )
        XCTAssertNotEqual(activity, otherActivity)
    }
    
    func testNotEqualsIfDifferentUserId() {
        let otherActivity = Activity(
            id: TestData.mainId,
            message: TestData.mainMessage,
            amount: TestData.mainAmount,
            userId: TestData.altUserId,
            timestamp: TestData.mainTimestamp
        )
        XCTAssertNotEqual(activity, otherActivity)
    }
    
    func testNotEqualsIfDifferentTimestamp() {
        let otherActivity = Activity(
            id: TestData.mainId,
            message: TestData.mainMessage,
            amount: TestData.mainAmount,
            userId: TestData.mainUserId,
            timestamp: TestData.altTimestamp
        )
        XCTAssertNotEqual(activity, otherActivity)
    }
    
}

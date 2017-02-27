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
    
    func testNotEqualsIfDifferentMessage() {
        let otherActivity = Activity(
            message: TestData.altMessage,
            amount: TestData.mainAmount,
            userId: TestData.mainUserId,
            timestamp: TestData.mainTimestamp
        )
        XCTAssertNotEqual(activity, otherActivity)
    }
    
    func testNotEqualsIfDifferentAmount() {
        let otherActivity = Activity(
            message: TestData.mainMessage,
            amount: TestData.altAmount,
            userId: TestData.mainUserId,
            timestamp: TestData.mainTimestamp
        )
        XCTAssertNotEqual(activity, otherActivity)
    }
    
    func testNotEqualsIfDifferentUserId() {
        let otherActivity = Activity(
            message: TestData.mainMessage,
            amount: TestData.mainAmount,
            userId: TestData.altUserId,
            timestamp: TestData.mainTimestamp
        )
        XCTAssertNotEqual(activity, otherActivity)
    }
    
    func testNotEqualsIfDifferentTimestamp() {
        let otherActivity = Activity(
            message: TestData.mainMessage,
            amount: TestData.mainAmount,
            userId: TestData.mainUserId,
            timestamp: TestData.altTimestamp
        )
        XCTAssertNotEqual(activity, otherActivity)
    }
    
    func testFromValidJson() {
        // TODO: - There is problem with date formatting. No observed influence on app but in tests dates 12h different.
        let json = TestData.activityJson
        let jsonActivity = Activity.fromJson(json: json)!
        XCTAssertEqual(jsonActivity, activity)
    }
    
    func testFromInvalidJson() {
        let json = [String: AnyObject]()
        let jsonActivity = Activity.fromJson(json: json)
        XCTAssertNil(jsonActivity)
    }
    
}

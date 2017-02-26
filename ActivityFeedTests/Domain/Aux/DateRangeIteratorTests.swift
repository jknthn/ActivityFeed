//
//  DateRangeIteratorTests.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 26/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import XCTest
@testable import ActivityFeed

class DateRangeIteratorTests: XCTestCase {
    
    var iterator: DateRangeIterator!
    var date: Date!
    
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()
        date = Date()
        iterator = DateRangeIterator(startDate: date)
    }
    
    override func tearDown() {
        date = nil
        iterator = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testChangeOldestDate() {
        let dateToChange = Date()
        iterator.changeOldestDate(to: dateToChange)
        XCTAssertEqual(dateToChange, iterator.oldestDate)
    }
    
    func testStartDateOlderThanOldest() {
        iterator.changeOldestDate(to: Date())
        XCTAssertNil(iterator.next())
    }
    
    func testOneItem() {
        iterator.changeOldestDate(to: Date().subtracting2Weeks())
        XCTAssertNotNil(iterator.next())
        XCTAssertNil(iterator.next())
    }
    
    func testTestTwoItems() {
        iterator.changeOldestDate(to: Date().subtracting2Weeks().subtracting2Weeks())
        XCTAssertNotNil(iterator.next())
        XCTAssertNotNil(iterator.next())
        XCTAssertNil(iterator.next())
    }
    
    func testRangeIsValid() {
        let range = iterator.next()!
        XCTAssertEqual(range.upperBound, date)
        XCTAssertEqual(range.lowerBound, date.subtracting2Weeks())
    }
    
}

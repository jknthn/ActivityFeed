//
//  ShowActivitiesUseCaseTests.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 24/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import XCTest
@testable import ActivityFeed

class ShowActivitiesUseCaseTests: XCTestCase {
    
    var useCase: ShowActivitiesUseCase!
    var entityGateway: EnitityGatewayMock!
    var resultingData = [ActivityDisplayData]()
    
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()
        entityGateway = EnitityGatewayMock()
        let factory = UseCaseFactory(entityGateway: entityGateway)
        useCase = factory.createUseCase(for: .showActivities(completion: { activities in
            self.resultingData.append(contentsOf: activities)
        })) as! ShowActivitiesUseCase
    }
    
    override func tearDown() {
        entityGateway = nil
        useCase = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testEmptyRepositoryGeneratesNoData() {
        useCase.execute()
        XCTAssertEqual(resultingData.count, 0)
    }
    
    func testConvertsOneActivityToDisplayData() {
        entityGateway.activities = [Activity.main]
        useCase.execute()
        XCTAssertEqual(resultingData.count, 1)
        XCTAssertEqual(ActivityDisplayData.main, resultingData.first!)
    }
    
    func testConvertsTwoActivitiesToDisplayData() {
        entityGateway.activities = [Activity.main, Activity.alt]
        useCase.execute()
        XCTAssertEqual(resultingData.count, 2)
        XCTAssertEqual(ActivityDisplayData.main, resultingData.first!)
        XCTAssertEqual(ActivityDisplayData.alt, resultingData[1])
    }
    
    func testExecuteChangesRange() {
        entityGateway.activities = [Activity.main]
        useCase.execute()
        let firstRange = entityGateway.range
        useCase.execute()
        let secondRange = entityGateway.range
        XCTAssertNotEqual(firstRange, secondRange)
    }
    
    func testExecuteRecursesOnNoActivitiesFound() {
        useCase.execute()
        XCTAssertLessThan(entityGateway.range.lowerBound, entityGateway.minDate)
    }
    
    // MARK: - Mocks
    
    class EnitityGatewayMock: EntityGateway {
        
        let minDate = Date(timeIntervalSince1970: 0.0)
        
        var activities = [Activity]()
        var range: Range<Date>!

        func getActivities(for range: Range<Date>, completion: @escaping (Result<(Date, [Activity]), Error>) -> Void) {
            self.range = range
            completion(Result.success(minDate, activities))
        }
    
    }
    
}

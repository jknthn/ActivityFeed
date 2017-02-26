//
//  UseCaseFactoryTests.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 24/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import XCTest
@testable import ActivityFeed

class UseCaseFactoryTest: XCTestCase {
    
    var useCaseFactory: UseCaseFactory!
    var entityGateway: EnitityGatewayMock!
    
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()
        entityGateway = EnitityGatewayMock()
        useCaseFactory = UseCaseFactory(entityGateway: entityGateway)
    }
    
    override func tearDown() {
        entityGateway = nil
        useCaseFactory = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testFactoryCreatesShowActivitiesUseCase() {
        let useCase = useCaseFactory.createUseCase(for: .showActivities(completion: { _ in }))
        XCTAssertNotNil(useCase as? ShowActivitiesUseCase)
    }
    
    // MARK: - Mocks
    
    class EnitityGatewayMock: EntityGateway {
        func getActivities(for range: Range<Date>, completion: @escaping (Result<(Date, [Activity]), Error>) -> Void) { }
    }
    
}

//
//  InMemoryRepository.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 19/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

class InMemoryRepository: EntityGateway {
    
    private static let currentDate = Date()
    private static let acivities = [
        Activity(
            id: "1234a",
            message: "This is first message",
            amount: 2.5,
            userId: 1,
            timestamp: dateBySubstractingDaysFromCurrent(amount: 20)
        ),
        Activity(
            id: "3245f",
            message: "This is second message",
            amount: 41.0,
            userId: 2,
            timestamp: dateBySubstractingDaysFromCurrent(amount: 15)
        ),
        Activity(
            id: "1234a",
            message: "This is third message",
            amount: 7.2,
            userId: 1,
            timestamp: dateBySubstractingDaysFromCurrent(amount: 10)
        ),
        Activity(
            id: "1234a",
            message: "This is fourth message",
            amount: 10.2,
            userId: 3,
            timestamp: dateBySubstractingDaysFromCurrent(amount: 5)
        )
    ]
    
    // MARK: - Static
    
    private static func dateBySubstractingDaysFromCurrent(amount: Int) -> Date {
        return Calendar.autoupdatingCurrent.date(byAdding: .day, value: -amount, to: currentDate)!
    }
    
    // MARK: - EntityGateway
    
    func getActivities(for range: Range<Date>, completion: @escaping (Date, [Activity]) -> Void) {
        let selectedActivities = InMemoryRepository.acivities.filter { range.contains($0.timestamp) }
        let oldestDate = InMemoryRepository.acivities.map { $0.timestamp }.sorted(by: <).first!
        completion(oldestDate, selectedActivities)
    }
}

//
//  InMemoryRepository.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 19/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

class InMemoryRepository: EntityGateway {
    
    private static let oldestActivityDate = Date(timeIntervalSince1970: 0)
    private static let acivities = [
        Activity(
            id: "1234a",
            message: "This is first message",
            amount: 2.5,
            userId: 1,
            timestamp: oldestActivityDate
        ),
        Activity(
            id: "3245f",
            message: "This is second message",
            amount: 41.0,
            userId: 2,
            timestamp: dateByAddingDaysToOldestDate(amount: 10)
        ),
        Activity(
            id: "1234a",
            message: "This is third message",
            amount: 7.2,
            userId: 1,
            timestamp: dateByAddingDaysToOldestDate(amount: 15)
        ),
        Activity(
            id: "1234a",
            message: "This is fourth message",
            amount: 10.2,
            userId: 3,
            timestamp: dateByAddingDaysToOldestDate(amount: 20)
        )
    ]
    
    // MARK: - Static
    
    private static func dateByAddingDaysToOldestDate(amount: Int) -> Date {
        return Calendar(identifier: NSLocale.current.calendar.identifier).date(
            byAdding: .day,
            value: amount,
            to: oldestActivityDate
        )!
    }
    
    // MARK: - EntityGateway
    
    func getActivities(for range: Range<Date>, completion: @escaping (Date, [Activity]) -> Void) {
        let selectedActivities = InMemoryRepository.acivities.filter { range.contains($0.timestamp) }
        completion(InMemoryRepository.oldestActivityDate, selectedActivities)
    }
}

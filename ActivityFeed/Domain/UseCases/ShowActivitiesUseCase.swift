//
//  ShowActivitiesUseCase.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 19/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

typealias ShowActivitiesCompletion = ([ActivityDisplayData]) -> Void

class ShowActivitiesUseCase: UseCase {
    
    private let entityGateway: EntityGateway
    private let completion: ShowActivitiesCompletion
    
    private var oldestDate: Date?
    
    private var startDate: Date?
    private var endDate: Date?
    
    // MARK: - Initialization
    
    init(entityGateway: EntityGateway, completion: @escaping ShowActivitiesCompletion) {
        self.entityGateway = entityGateway
        self.completion = completion
        
        startDate = Date()
        // TODO: - Inject locale
        endDate = dateBySubstracting2Weeks(from: startDate!)
    }
    
    // MARK: - UseCase
    
    func execute() {
        guard let range = createNextRange() else {
            return
        }
        entityGateway.getActivities(for: range) { [weak self] oldest, activities in
            self?.oldestDate = oldest
            self?.completion(activities.map(ActivityDisplayData.init))
        }
    }
    
    // MARK: - Private
    
    private func createNextRange() -> Range<Date>? {
        guard let start = startDate, let end = endDate else {
            // TODO: - Think about it / handle
            assertionFailure("Dates not set")
            return nil
        }
        
        let range = Range(uncheckedBounds: (lower: end, upper: start))
        
        startDate = end
        endDate = dateBySubstracting2Weeks(from: end)
        
        return range
    }
    
    private func dateBySubstracting2Weeks(from date: Date) -> Date {
        return Calendar(identifier: NSLocale.current.calendar.identifier).date(byAdding: .day, value: 14, to: date)!
    }
}

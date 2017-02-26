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
        endDate = startDate?.substracting2Weeks()
    }
    
    // MARK: - UseCase
    
    func execute() {
        guard let range = createNextRange() else {
            return
        }
        entityGateway.getActivities(for: range) { [weak self] oldest, activities in
            self?.oldestDate = oldest
            self?.completion(activities.map(ActivityDisplayData.init).sorted { $0.0.timestamp > $0.1.timestamp })
        }
    }
    
    // MARK: - Private
    
    private func createNextRange() -> Range<Date>? {
        guard let start = startDate, let end = endDate else {
            // TODO: - Think about it / handle
            assertionFailure("Dates not set")
            return nil
        }
        
        if let oldest = oldestDate, start < oldest {
            return nil
        }
        
        let range = Range(uncheckedBounds: (lower: end, upper: start))
        startDate = end
        endDate = end.substracting2Weeks()
        return range
    }
    

}

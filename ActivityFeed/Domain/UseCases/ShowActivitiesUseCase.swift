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
    private var rangeIterator = DateRangeIterator()
    
    // MARK: - Initialization
    
    init(entityGateway: EntityGateway, completion: @escaping ShowActivitiesCompletion) {
        self.entityGateway = entityGateway
        self.completion = completion
    }
    
    // MARK: - UseCase
    
    func execute() {
        guard let range = rangeIterator.next() else {
            return
        }
        entityGateway.getActivities(for: range) { result in
            result.onSuccess { response in
                guard !response.activities.isEmpty else {
                    self.execute()
                    return
                }
                self.rangeIterator.changeOldestDate(to: response.oldest)
                self.completion(response.activities.map(ActivityDisplayData.init).sorted { $0.0.timestamp > $0.1.timestamp })
            }
            result.onError { error in
                assertionFailure("Error: \(error)") // TODO: - Handle error
            }
        }
    }

}

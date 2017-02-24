//
//  ActivityFeedPresenter.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 19/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

class ActivityFeedPresenter {
    
    private let factory: UseCaseFactory
    private var acitvities = [ActivityDisplayData]()
    private var useCase: UseCase!
    
    var view: ActivityFeedView?
    
    var activitiesCount: Int {
        return acitvities.count
    }
    
    // MARK: - Initialization
    
    init(factory: UseCaseFactory) {
        self.factory = factory
    }
    
    // MARK: - Public
    
    func viewReady() {
        useCase = factory.createUseCase(for: .showActivities(completion: { activities in
            self.acitvities.append(contentsOf: activities)
        }))
        useCase.execute()
        view?.reloadView()
    }
    
    func setupCell(_ cell: ActivityCell, for row: Int) {
        cell.updateAmount(acitvities[row].amount)
        cell.updateMessage(acitvities[row].message)
        cell.updateDate(acitvities[row].date)
        cell.updateImageUrl(acitvities[row].imageUrl)
    }
    
    func loadMore() {
        let currentCount = activitiesCount
        useCase.execute()
        let newActivities = activitiesCount - currentCount
        if newActivities > 0 {
            view?.reloadItems(at: currentCount...activitiesCount - 1)            
        }
    }
    
    
}

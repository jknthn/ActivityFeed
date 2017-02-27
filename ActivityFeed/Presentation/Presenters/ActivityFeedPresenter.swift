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
    private var showActivitiesUseCase: UseCase!
    
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
        showActivitiesUseCase = factory.createUseCase(for: .showActivities(completion: { activities in
            let currentCount = self.activitiesCount
            self.acitvities.append(contentsOf: activities)
            let newActivities = self.activitiesCount - currentCount
            if newActivities > 0 {
                self.view?.addItems(at: currentCount...self.activitiesCount - 1)
            }
        }))
        showActivitiesUseCase.execute()
    }
    
    func setupCell(_ cell: ActivityCell, for row: Int) {
        cell.updateAmount(acitvities[row].amount)
        cell.updateMessage(acitvities[row].message)
        cell.updateDate(acitvities[row].date)
        factory.createUseCase(for: .getAvatar(id: acitvities[row].userId, completion: { url in
            cell.updateImageUrl(url)
        })).execute()
    }
    
    func loadMore() {
        showActivitiesUseCase.execute()
    }
    
}

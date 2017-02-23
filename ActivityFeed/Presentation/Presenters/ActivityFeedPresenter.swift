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
    private let acitvities = [Activity]()
    
    var view: ActivityFeedView?
    
    var numberOfItems: Int {
        return acitvities.count
    }
    
    // MARK: - Initialization
    
    init(factory: UseCaseFactory) {
        self.factory = factory
    }
    
    // MARK: - Public
    
    func viewReady() {
        factory.createUseCase(for: .showActivities(completion: { activities in
            print(activities)
        })).execute()
    }
    
}

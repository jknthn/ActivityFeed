//
//  ActivityFeedConnector.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 19/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import UIKit

class ActivityFeedConnector {
    
    private let entityGateway: EntityGateway
    
    // MARK: - Initailization
    
    init(entityGateway: EntityGateway) {
        self.entityGateway = entityGateway
    }
    
    // MARK: - Public
    
    func createRootViewController() -> UIViewController {
        let factory = UseCaseFactory(entityGateway: entityGateway)
        let presenter = ActivityFeedPresenter(factory: factory)
        let viewController = ActivityFeedViewController(presenter: presenter, connector: self)
        return UINavigationController(rootViewController: viewController)
    }
}

//
//  ActivityFeedConnector.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 19/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import UIKit

class ActivityFeedConnector {
    
    
    // MARK: - Public
    
    func createRootViewController() -> UIViewController {
        let presenter = ActivityFeedPresenter()
        let viewController = ActivityFeedViewController(presenter: presenter, connector: self)
        return UINavigationController(rootViewController: viewController)
    }
}

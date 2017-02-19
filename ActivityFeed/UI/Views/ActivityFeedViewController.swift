//
//  ActivityFeedViewController.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 19/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import UIKit

class ActivityFeedViewController: UIViewController, ActivityFeedView {
    
    private let presenter: ActivityFeedPresenter
    private let connector: ActivityFeedConnector
    
    // MARK: - Initialization 
    
    init(presenter: ActivityFeedPresenter, connector: ActivityFeedConnector) {
        self.presenter = presenter
        self.connector = connector
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

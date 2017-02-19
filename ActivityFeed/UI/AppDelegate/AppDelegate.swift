//
//  AppDelegate.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 19/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private lazy var rootConnector: ActivityFeedConnector = {
        let entityGateway = InMemoryRepository()
        let connector = ActivityFeedConnector(entityGateway: entityGateway)
        return connector
    }()

    // MARK: - AppDelegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        return true
    }
    
    // MARK: - Private
    
    private func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootConnector.createRootViewController()
        window?.makeKeyAndVisible()
    }
}


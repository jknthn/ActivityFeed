//
//  Activity+TestData.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 20/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation
@testable import ActivityFeed

extension Activity {
    
    static let main = Activity(
        id: TestData.mainId,
        message: TestData.mainMessage,
        amount: TestData.mainAmount,
        userId: TestData.mainUserId,
        timestamp: TestData.mainTimestamp
    )
    
    static let alt = Activity(
        id: TestData.altId,
        message: TestData.altMessage,
        amount: TestData.altAmount,
        userId: TestData.altUserId,
        timestamp: TestData.altTimestamp
    )
    
}

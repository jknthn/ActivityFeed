//
//  TestData.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 20/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

struct TestData {
    
    static let mainMessage = "<strong>Something something</strong> something"
    static let altMessage = "Something something something"
    static let mainAmount = 1.4 as Float
    static let altAmount = 4.5 as Float
    static let mainUserId = 1
    static let altUserId = 2
    static let mainTimestamp = Date()
    static let altTimestamp = Date().addingTimeInterval(-15 * 24 * 60 * 60)
    static let activityJson: [String: AnyObject] = [
        "message": mainMessage as AnyObject,
        "amount": mainAmount as AnyObject,
        "userId": mainUserId as AnyObject,
        "timestamp": ISO8601DateFormatter().string(from: mainTimestamp) as AnyObject
    ]
    
}

//
//  ActivityDisplayData.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 19/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

struct ActivityDisplayData: Equatable {
    
    private let activity: Activity
    
    var message: NSAttributedString {
        return NSAttributedString(string: activity.message)
    }
    
    var amount: String {
        // TODO: - Use NumberFormatter
        return "$\(activity.amount)"
    }
    
    var date: String {
        return DateFormatter.app.string(from: activity.timestamp)
    }
    
    var userId: Int {
        return activity.userId
    }
    
    var timestamp: Double {
        return activity.timestamp.timeIntervalSinceReferenceDate
    }
    
    // MARK: - Initialization
    
    init(activity: Activity) {
        self.activity = activity
    }
    
    // MARK: - Equatable
    
    static func ==(lhs: ActivityDisplayData, rhs: ActivityDisplayData) -> Bool {
        if lhs.activity != rhs.activity { return false }
        return true
    }
    
}

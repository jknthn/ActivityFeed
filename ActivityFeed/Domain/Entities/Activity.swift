//
//  Activity.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 19/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

struct Activity: Equatable {
    
    let id: String
    let message: String
    let amount: Float
    let userId: Int
    let timestamp: Date
    
    // MARK: - Equatable
    
    static func ==(lhs: Activity, rhs: Activity) -> Bool {
        if lhs.id != rhs.id { return false }
        if lhs.message != rhs.message { return false }
        if lhs.amount != rhs.amount { return false }
        if lhs.userId != rhs.userId { return false }
        if lhs.timestamp != rhs.timestamp { return false }
        return true
    }
    
}

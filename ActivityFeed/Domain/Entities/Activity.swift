//
//  Activity.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 19/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

struct Activity: JsonParsable, Equatable {
    
    let message: String
    let amount: Float
    let userId: Int
    let timestamp: Date
    
    // MARK: - JsonParsable
    
    static func fromJson(json: JsonDictionary) -> Activity? {
        guard
            let message = json["message"] as? String,
            let amount = json["amount"] as? Float,
            let userId = json["userId"] as? Int,
            let timestampRaw = json["timestamp"] as? String,
            let timestamp = DateFormatter.api.date(from: timestampRaw)
        else {
            return nil
        }
        return Activity(message: message, amount: amount, userId: userId, timestamp: timestamp)
    }
    
    // MARK: - Equatable
    
    static func ==(lhs: Activity, rhs: Activity) -> Bool {
        if lhs.message != rhs.message { return false }
        if lhs.amount != rhs.amount { return false }
        if lhs.userId != rhs.userId { return false }
        if Int(lhs.timestamp.timeIntervalSince1970) != Int(rhs.timestamp.timeIntervalSince1970) { return false }
        return true
    }
    
}

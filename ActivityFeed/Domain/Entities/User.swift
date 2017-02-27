//
//  User.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 27/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

struct User: JsonParsable {
    
    let userId: Int
    let displayName: String
    let avatarUrl: URL
    
    // MARK: - JsonParsable
    
    static func fromJson(json: JsonDictionary) -> User? {
        guard
            let userId = json["userId"] as? Int,
            let displayName = json["displayName"] as? String,
            let avatarUrlString = json["avatarUrl"] as? String,
            let avatarUrl = URL(string: avatarUrlString)
        else {
            return nil
        }
        return User(userId: userId, displayName: displayName, avatarUrl: avatarUrl)
    }
    
}

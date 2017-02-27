//
//  ActivitiesResponse.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 26/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

struct ActivitiesResponse: JsonParsable {
    
    let oldest: Date
    let activities: [Activity]
    
    // MARK: - JsonParsable
    
    static func fromJson(json: JsonDictionary) -> ActivitiesResponse? {
        guard
            let oldestRaw = json["oldest"] as? String,
            let oldest = DateFormatter.api.date(from: oldestRaw),
            let activitiesJson = json["activities"] as? [JsonDictionary]
        else {
            return nil
        }
        return ActivitiesResponse(oldest: oldest, activities: activitiesJson.flatMap(Activity.fromJson))
    }
}

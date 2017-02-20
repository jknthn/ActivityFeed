//
//  ActivityDisplayData.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 19/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

struct ActivityDisplayData {
    
    private let activity: Activity
    
    var message: String {
        return activity.message
    }
    
    var amount: String {
        // TODO: - Use NumberFormatter
        return "$\(activity.amount)"
    }
    
    var dateString: String {
        // TODO: - Inject Locale, Format output, use actual date
        return "22 Sep 2016"
    }
    
    var imageUrl: URL? {
        return nil
    }
    
}

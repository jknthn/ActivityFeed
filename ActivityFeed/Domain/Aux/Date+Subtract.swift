//
//  Date+Subtract.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 26/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

extension Date {
    
    func substracting2Weeks() -> Date? {
        return Calendar.autoupdatingCurrent.date(byAdding: .day, value: -14, to: self)
    }
    
}

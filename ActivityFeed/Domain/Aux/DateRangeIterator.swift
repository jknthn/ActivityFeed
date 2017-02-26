//
//  DateRangeIterator.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 26/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

struct DateRangeIterator: Sequence, IteratorProtocol {
    
    private(set) var oldestDate = Date(timeIntervalSince1970: 0.0)
    private var startDate: Date
    private var endDate: Date
    
    // MARK: - Initialization
    
    init(startDate: Date = Date()) {
        self.startDate = startDate
        self.endDate = startDate.subtracting2Weeks()
    }
    
    // MARK: - Public 
    
    mutating func changeOldestDate(to date: Date) {
        if oldestDate != date {
            oldestDate = date
        }
    }
    
    // MARK: - IteratorProtocol
    
    mutating func next() -> Range<Date>? {
        guard startDate > oldestDate else {
            return nil
        }
        
        let range = Range(uncheckedBounds: (lower: endDate, upper: startDate))
        startDate = endDate
        endDate = endDate.subtracting2Weeks()
        return range
    }
    
}

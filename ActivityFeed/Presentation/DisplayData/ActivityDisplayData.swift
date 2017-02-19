//
//  ActivityDisplayData.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 19/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

struct WordData {
    
    enum WordState: Int {
        case normal
        case highlighted
    }
    
    let state: WordState
    let word: String
}

struct ActivityDisplayData {
    
    private let activity: Activity
    private let boldRegex = "<\\s*strong[^>]*>(.*?)<\\s*\\/\\s*strong>"
    
}

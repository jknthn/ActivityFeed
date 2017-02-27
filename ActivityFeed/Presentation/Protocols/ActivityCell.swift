//
//  ActivityCell.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 23/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

protocol ActivityCell {
    func updateImageUrl(_ url: URL)
    func updateMessage(_ message: String)
    func updateDate(_ date: String)
    func updateAmount(_ amount: String)
}

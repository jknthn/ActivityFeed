//
//  ActivityFeedView.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 19/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

protocol ActivityFeedView {
    func finishLoading()
    func addItems(at range: CountableClosedRange<Int>)
}

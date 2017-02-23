//
//  LabelFactory.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 23/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import UIKit

class LabelFactory {
    
    enum LabelType {
        case message
        case date
        case amount
    }
    
    func createLabel(for type: LabelType) -> UILabel {
        switch type {
        case .message:
            break
        case .date:
            break
        case .amount:
            break
        }
    }
}

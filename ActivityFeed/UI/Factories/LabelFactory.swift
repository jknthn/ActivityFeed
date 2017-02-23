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
    
    // MARK: - Factory
    
    func create(for type: LabelType) -> UILabel {
        switch type {
        case .message:
            return messageLabel(from: mainLabel())
        case .date:
            return dateLabel(from: mainLabel())
        case .amount:
            return amountLabel(from: mainLabel())
        }
    }
    
    // Private
    
    private func mainLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func messageLabel(from label: UILabel) -> UILabel {
        label.font = FontPalette.primary
        return label
    }
    
    private func dateLabel(from label: UILabel) -> UILabel {
        label.textColor = ColorPalette.textNormal
        label.font = FontPalette.secondary
        return label
    }
    
    private func amountLabel(from label: UILabel) -> UILabel {
        label.textColor = ColorPalette.textAmountPositive
        label.font = FontPalette.primary
        label.textAlignment = .right
        return label
    }
}

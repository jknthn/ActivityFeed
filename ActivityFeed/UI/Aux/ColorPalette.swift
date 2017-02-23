//
//  ColorPalette.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 23/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(r: UInt8, g: UInt8, b: UInt8, a: Float = 1.0) {
        self.init(
            red: CGFloat(r) / 255.0,
            green: CGFloat(g) / 255.0,
            blue: CGFloat(b) / 255.0,
            alpha: CGFloat(a)
        )
    }
    
}

class ColorPalette {
    
    static let background = UIColor.white
    static let textHighlighted = UIColor.black
    static let textNormal = UIColor(r: 173, g: 184, b: 189)
    static let textAmountPositive = UIColor(r: 88, g: 191, b: 10)
    
}

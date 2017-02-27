//
//  AttributedStringCreator.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 27/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import UIKit

struct AttributedStringCreator {
    
    private let pattern = "<strong>(.*?)</strong>"
    private let tags = ["<strong>", "</strong>"]
    
    private let regularAttributes = [
        NSForegroundColorAttributeName: ColorPalette.textNormal,
        NSFontAttributeName: FontPalette.primary
    ]
    private let strongAttributes = [
        NSForegroundColorAttributeName: ColorPalette.textHighlighted,
        NSFontAttributeName: FontPalette.primary
    ]
    
    let string: String
    
    // MARK: - Initialization
    
    init(string: String) {
        self.string = string
    }
    
    // MARK: - Public
    
    func create() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: string, attributes: regularAttributes)
        extractRanges().forEach { range in
            attributedString.addAttributes(strongAttributes, range: range)
        }
        tags.forEach { tag in
            attributedString.mutableString.replaceOccurrences(
                of: tag,
                with: "",
                options: [],
                range: NSRange(location: 0, length: attributedString.string.characters.count)
            )
        }
        return attributedString
    }
    
    // MARK: - Private
    
    private func extractRanges() -> [NSRange] {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            return regex.matches(
                in: string,
                options: [],
                range: NSRange(location: 0, length: string.characters.count)
            ).map { $0.range }
        } catch {
            return []
        }
    }
}

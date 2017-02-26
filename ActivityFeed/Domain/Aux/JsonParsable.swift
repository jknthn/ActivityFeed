//
//  JsonParsable.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 26/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

typealias JsonDictionary = [String: Any]

protocol JsonParsable {
    static func fromJSON(json: JsonDictionary) -> Self?
}

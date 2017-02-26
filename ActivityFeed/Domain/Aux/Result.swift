//
//  Result.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 26/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

enum Result<Value, Error> {
    case success(Value)
    case error(Error)
    
    func onSuccess(_ closure: (Value) -> Void) {
        if case .success(let value) = self {
            closure(value)
        }
    }
    
    func onError(_ closure: (Error) -> Void) {
        if case .error(let error) = self {
            closure(error)
        }
    }
}

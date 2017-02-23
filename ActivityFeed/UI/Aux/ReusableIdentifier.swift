//
//  ReusableIdentifier.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 23/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import UIKit

protocol ReusableIdentifier: AnyObject {
    
    static var identifier: String { get }
    
}

extension ReusableIdentifier {
    
    static var identifier: String {
        return String(describing: self.self)
    }
    
}

extension UITableViewCell: ReusableIdentifier { }

extension UITableView {
    
    func registerCellsWithClass(_ cellClass: UITableViewCell.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.identifier)
    }
    
    func dequeueReusableCellOfType<T: UITableViewCell>(type: T.Type, forIndexPath indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: (type as ReusableIdentifier.Type).identifier, for: indexPath) as! T
    }
    
}

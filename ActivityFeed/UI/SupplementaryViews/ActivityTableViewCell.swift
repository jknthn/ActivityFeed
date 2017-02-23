//
//  ActivityTableViewCell.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 23/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import UIKit


class ActivityTableViewCell: UITableViewCell, ActivityCell {
    
    // MARK: - Initialization
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCell()
    }
    
    // MARK: - UITableViewCell
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    // MARK: - Setup
    
    func setupCell() {
        
    }
    
    // MARK: - ActivityCell
    
    func updateImageUrl(_ url: URL) {
        
    }
    
    func updateMessage(_ message: NSAttributedString) {
        
    }
    
    func updateDate(_ date: String) {
        
    }
    
    func updateAmount(_ amount: String) {
        
    }
}

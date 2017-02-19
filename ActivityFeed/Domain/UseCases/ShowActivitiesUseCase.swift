//
//  ShowActivitiesUseCase.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 19/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

class ShowActivitiesUseCase: UseCase {
    
    private let entityGateway: EntityGateway
    
    // MARK: - Initialization
    
    init(entityGateway: EntityGateway) {
        self.entityGateway = entityGateway
    }
    
    // MARK: - UseCase
    
    func execute() {
        
    }
}

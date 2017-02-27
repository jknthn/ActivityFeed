//
//  UseCaseFactory.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 19/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

class UseCaseFactory {
    
    enum Use {
        case showActivities(completion: ShowActivitiesCompletion)
        case getAvatar(id: Int, completion: GetUserAvatarCompletion)
    }
    
    private let entityGateway: EntityGateway
    
    // MARK: - Initialization
    
    init(entityGateway: EntityGateway) {
        self.entityGateway = entityGateway
    }
    
    // MARK: - Factory
    
    func createUseCase(for use: Use) -> UseCase {
        switch use {
        case .showActivities(let completion):
            return ShowActivitiesUseCase(entityGateway: entityGateway, completion: completion)
        case .getAvatar(let id, let completion):
            return GetUserAvatarUseCase(id: id, entityGateway: entityGateway, completion: completion)
        }
    }
    
}

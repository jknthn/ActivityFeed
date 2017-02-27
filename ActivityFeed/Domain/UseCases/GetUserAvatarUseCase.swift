//
//  GetUserAvatarUseCase.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 27/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

typealias GetUserAvatarCompletion = (URL) -> Void

class GetUserAvatarUseCase: UseCase {
    
    private let id: Int
    private let entityGateway: EntityGateway
    private let completion: GetUserAvatarCompletion
    
    // MARK: Initialization
    
    init(id: Int, entityGateway: EntityGateway, completion: @escaping GetUserAvatarCompletion) {
        self.id = id
        self.entityGateway = entityGateway
        self.completion = completion
    }
    
    // MARK: - UseCase
    
    func execute() {
        entityGateway.getUser(for: id) { result in
            result.onSuccess { user in
                self.completion(user.avatarUrl)
            }
            result.onError { error in
                assertionFailure("Error: \(error)") // TODO: - Handle error
            }
        }
    }
}



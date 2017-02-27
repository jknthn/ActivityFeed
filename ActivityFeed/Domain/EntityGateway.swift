//
//  EntityGateway.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 19/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

protocol EntityGateway {
    func getActivities(for range: Range<Date>, completion: @escaping (Result<ActivitiesResponse, Error>) -> Void)
    func getUser(for id: Int, completion: @escaping (Result<User, Error>) -> Void)
}

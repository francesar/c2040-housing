//
//  Constants.swift
//  housing
//
//  Created by Cesar Ibarra on 7/15/17.
//  Copyright © 2017 Cesar Ibarra. All rights reserved.
//

import Foundation

struct APIConstants {
    
    static let serverPrefix = "http://c2040-housing.herokuapp.com/"
    
    struct User {
        static let login = URL(string:"\(APIConstants.serverPrefix)api/user/auth")!
        static let createNewUser = URL(string:"\(APIConstants.serverPrefix)api/user/create")!
    }
    
    struct WorkItems {
        static let createWorkItem = URL(string:"\(APIConstants.serverPrefix)api/work_item")!
        static let getWorkItemById = URL(string:"\(APIConstants.serverPrefix)api/work_item")!
        static let getAllWorkItems = URL(string:"\(APIConstants.serverPrefix)api/work_items")!
    }
}

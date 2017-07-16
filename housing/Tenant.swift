//
//  Tenant.swift
//  housing
//
//  Created by Cesar Ibarra on 7/15/17.
//  Copyright © 2017 Cesar Ibarra. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class Tenant: User {
    
    var name: String
    var id: String?
    var phoneNumber: String
    var email: String
    var location: String
    var isLoggedIn: Bool

    init(name: String, phoneNumber: String, email: String, location: String) {
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
        self.location = location
        self.isLoggedIn = true
        self.id = self.login()
    }
    
    func login() -> String {
        // Post to db to see if the user exists, if it does then log the user in
        // put the user in the cache?/user defaults
        return "1"
    }
    
    func logout() {
        // Remove user from cache/user defaults
    }
}

//
//  User.swift
//  housing
//
//  Created by Cesar Ibarra on 7/15/17.
//  Copyright © 2017 Cesar Ibarra. All rights reserved.
//

import Foundation

protocol User {

    var name: String { get set }
    var id: String? { get set }
    var phoneNumber: String { get set }
    var email: String { get set }
    var location: String { get set }
    
    func login() -> String
    func logout() -> Void
}

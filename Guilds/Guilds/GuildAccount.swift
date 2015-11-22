//
//  Account.swift
//  Guilds
//
//  Created by Downey, Eric on 11/21/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import Foundation

public struct GuildAccount {
    var username: String
    var password: String
    var name: (String, String)
    var email: String
    var phoneNumber: String
    
    public func getDictionaryRepresentation() -> [String: String] {
        return [
            "username": self.username,
            "password": self.password,
            "firstName": self.name.0,
            "lastName": self.name.1,
            "email": self.email,
            "phoneNumber": self.phoneNumber
        ]
    }
}
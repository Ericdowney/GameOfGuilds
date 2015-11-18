//
//  AccountViewLogic.swift
//  Guilds
//
//  Created by Downey, Eric on 11/18/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import UIKit
import Parse

class AccountViewLogic: NSObject {
    
    override init() {
        super.init()
    }
    
    func createAccountWithUsername(username: String, andConfirmedPassword pass: (String, String), forUserWithName name: (String, String), email: String, andPhoneNumber phone: String) -> PFObject {
        let userObject = PFObject(className: "User")
        userObject["username"] = username
        userObject["password"] = pass.0
        userObject["firstName"] = name.0
        userObject["lastName"] = name.1
        userObject["email"] = email
        userObject["phoneNumber"] = phone
        return userObject;
    }
    
}
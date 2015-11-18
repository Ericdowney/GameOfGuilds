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
    
    func createAccountWithUsername(username: String, andConfirmedPassword pass: (String, String), forUserWithName name: (String, String), email: String, andPhoneNumber: String) -> PFObject {
        return PFObject(className: "User")
    }
    
}
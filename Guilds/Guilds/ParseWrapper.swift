//
//  ParseWrapper.swift
//  Guilds
//
//  Created by Downey, Eric on 11/19/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import Foundation
import Parse

public class ParseWrapper: NSObject {
    
    public func saveObject(className: String, dictionary: [String: AnyObject], completionHandler: (Bool -> Void)?) {
        let obj = PFObject(className: className)
        for (key, value) in dictionary {
            obj[key] = value
        }
        
        obj.saveInBackgroundWithBlock { success, err in
            completionHandler?(success)
        }
    }
    
    public func saveUser(dictionary: [String: AnyObject], completionHandler: (Bool -> Void)?) {
        let user = PFUser()
        for (key, value) in dictionary {
            user[key] = value
        }
        
        user.saveInBackgroundWithBlock { success, err in
            completionHandler?(success)
        }
    }
    
    public func signupUser(dictionary: [String: AnyObject], completionHandler: (Bool -> Void)?) {
        let user = PFUser()
        for (key, value) in dictionary {
            user[key] = value
        }
        
        user.signUpInBackgroundWithBlock { success, err in
            completionHandler?(success)
        }
    }
    
    public func validUsername(username: String, completionHandler: (Bool -> Void)?) {
        let query = PFUser.query()
        query?.whereKey("username", equalTo: username)
        query?.countObjectsInBackgroundWithBlock { count, err in
            completionHandler?( count == 0 )
        }
    }
}
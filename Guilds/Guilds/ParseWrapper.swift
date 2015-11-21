//
//  ParseWrapper.swift
//  Guilds
//
//  Created by Downey, Eric on 11/19/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import Foundation
import Parse

class ParseWrapper: NSObject {
    
    func saveObject(className: String, dictionary: [String: AnyObject]) -> BFTask {
        let obj = PFObject(className: className)
        for (key, value) in dictionary {
            obj[key] = value
        }
        
        return obj.saveInBackground();
    }
    
}
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
    
    var authenticatedUser: PFUser?
    
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
    
    public func login(username: String, password: String, completionHandler: (Bool -> Void)?) {
        PFUser.logInWithUsernameInBackground(username, password: password) { user, err in
            self.authenticatedUser = user
            completionHandler?( user != nil )
        }
    }
    
    public func logout(completionHandler: (Void -> Void)?) {
        PFUser.logOutInBackgroundWithBlock { err in
            completionHandler?()
        }
    }
    
    public func validUsername(username: String, completionHandler: (Bool -> Void)?) {
        let query = PFUser.query()
        query?.whereKey("username", equalTo: username)
        query?.countObjectsInBackgroundWithBlock { count, err in
            completionHandler?( count == 0 )
        }
    }
    
    public func queryClass(name: String, completionHandler: ([PFObject] -> Void)?) {
        let query = PFQuery(className: name)
        query.findObjectsInBackgroundWithBlock { objs, err in
            completionHandler?(objs ?? [])
        }
    }
    
    public func saveImage(image: UIImage) -> PFFile {
        let imageData = UIImagePNGRepresentation(image)
        let file = PFFile(data: imageData!)
        file!.saveInBackground()
        return file!;
    }
    
    public func createRelationToUser() -> PFRelation {
        let relation = PFRelation()
        relation.addObject(self.authenticatedUser!)
        return relation;
    }
    
    public func getImageFromFile(obj: AnyObject?) -> UIImage? {
        let file = obj as! PFFile
        do {
            let imageData = try file.getData()
            return UIImage(data: imageData);
        }
        catch _ {}
        return nil;
    }
}
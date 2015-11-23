//
//  AccountViewLogicSpy.swift
//  Guilds
//
//  Created by Downey, Eric on 11/21/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import UIKit
import Guilds
import Parse

public class AccountViewLogicSpy: AccountViewLogic {
    var spy_createdAccount = false
    public override func createAccount(viewCtrl: UIViewController, account: GuildAccount, confirmation: (String, String), completionHandler: (Bool -> Void)?) {
        self.spy_createdAccount = true
        completionHandler?(true)
    }
    
    var spy_showStorboard = false
    public override func showStoryboardWithName(name: String, onViewController viewCtrl: UIViewController, completionHandler: (Void -> Void)?) {
        self.spy_showStorboard = true
        completionHandler?()
    }
}

public class ViewControllerSpy: UIViewController {
    var spy_presentedViewController = false
    public override func presentViewController(viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
        self.spy_presentedViewController = true
        completion?()
    }
}

public class ParseWrapperSpy: ParseWrapper {
    var spy_saved = false
    public override func saveObject(className: String, dictionary: [String : AnyObject], completionHandler: (Bool -> Void)?) {
        self.spy_saved = true
        completionHandler?(true)
    }
    
    var spy_userSaved = false
    public override func saveUser(dictionary: [String : AnyObject], completionHandler: (Bool -> Void)?) {
        self.spy_userSaved = true
        completionHandler?(true)
    }
    
    var spy_userSignedUp = false
    public override func signupUser(dictionary: [String : AnyObject], completionHandler: (Bool -> Void)?) {
        self.spy_userSignedUp = true
        completionHandler?(true)
    }
    
    var spy_validatedUsername = false
    var spy_shouldValidateUsername = true
    public override func validUsername(username: String, completionHandler: (Bool -> Void)?) {
        self.spy_validatedUsername = true
        completionHandler?(self.spy_shouldValidateUsername)
    }
    
    var spy_loggedIn = false
    var spy_shouldLogin = true
    public override func login(username: String, password: String, completionHandler: (Bool -> Void)?) {
        self.spy_loggedIn = true
        completionHandler?(self.spy_shouldLogin)
    }
    
    var spy_queryedClass = false
    var spy_query_objsToReturn: [AnyObject] = []
    public override func queryClass(name: String, completionHandler: ([AnyObject] -> Void)?) {
        self.spy_queryedClass = true
        completionHandler?(self.spy_query_objsToReturn)
    }
    
    var spy_imageFromFile = false
    public override func getImageFromFile(obj: AnyObject?) -> UIImage? {
        self.spy_imageFromFile = true
        return nil;
    }
    
    var spy_memberGuilds = false
    var spy_memberGuilds_objsToReturn: [AnyObject] = []
    public override func getMemberGuilds(completionHandler: ([AnyObject] -> Void)?) {
        self.spy_memberGuilds = false
        completionHandler?(self.spy_memberGuilds_objsToReturn)
    }
    
    var spy_addUserToGuild = false
    public override func addCurrentUserToGuild(objectId: String) {
        self.spy_addUserToGuild = true
    }
    
    var spy_queryRelation = false
    public override func queryRelation(relation: PFRelation, completionHandler: ([PFUser] -> Void)?) {
        self.spy_queryRelation = true
        completionHandler?([])
    }
    
    var spy_savedImage = false
    public override func saveImage(image: UIImage) -> PFFile {
        self.spy_savedImage = true
        return PFFile(data: NSData())!;
    }
    
    var spy_logout = false
    public override func logout(completionHandler: (Void -> Void)?) {
        self.spy_logout = true
        completionHandler?()
    }
    
    public func getMockUser() -> PFUser {
        let user = PFUser()
        user["username"] = "username"
        user["firstName"] = "firstName"
        user["lastName"] = "lastName"
        return user;
    }
}

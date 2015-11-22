//
//  AccountViewLogic.swift
//  Guilds
//
//  Created by Downey, Eric on 11/18/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import UIKit

public class AccountViewLogic: ViewLogic {
    
    var parseWrapper: ParseWrapper
    
    override public init() {
        self.parseWrapper = ParseWrapper()
        super.init()
    }
    
    public init(wrapper: ParseWrapper) {
        self.parseWrapper = wrapper
        super.init()
    }
    
    // MARK: - Account Information
    
    public func getAccountData() -> (isAuthenticated: Bool, username: String?, firstName: String?, lastName: String?) {
        if let user = self.parseWrapper.authenticatedUser {
            return (isAuthenticated: true, username: user["username"] as? String, firstName: user["firstName"] as? String, lastName: user["lastName"] as? String);
        }
        return (isAuthenticated: false, username: nil, firstName: nil, lastName: nil);
    }
    
    // MARK: - Account Creation
    
    public func createAccount(viewCtrl: UIViewController, account: GuildAccount, confirmPassword: String, completionHandler: (Bool -> Void)?) {
        
        if account.password != confirmPassword || account.password == "" {
            self.showErrorAlertViewOn(viewCtrl, withTitle: "Password Error", andSubTitle: "The passwords are invalid")
            completionHandler?(false);
            return;
        }
        self.parseWrapper.validUsername(account.username) { valid in
            self.validateUserNameCallback(valid, withAccount: account, andViewCtrl: viewCtrl, orignalCompletionHandler: completionHandler)
        }
    }
    
    private func validateUserNameCallback(valid: Bool, withAccount account: GuildAccount, andViewCtrl viewCtrl: UIViewController, orignalCompletionHandler: (Bool -> Void)?) {
        if valid {
            self.parseWrapper.signupUser(account.getDictionaryRepresentation()) { success in
                orignalCompletionHandler?(success)
            }
            return;
        }
        self.showErrorAlertViewOn(viewCtrl, withTitle: "Username Error", andSubTitle: "Your username is already taken.")
        orignalCompletionHandler?(false)
    }
    
    // MARK: - Log in
    
    public func loginWithUsername(username: String, andPassword pass: String, completionHandler: (Bool -> Void)?) {
        self.parseWrapper.login(username, password: pass, completionHandler: completionHandler)
    }
}